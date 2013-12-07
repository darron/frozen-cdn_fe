class Website < ActiveRecord::Base
  require Rails.root + "lib/applog"
  validates_uniqueness_of :token
  validates_presence_of :ttl
  validates :weburl,
    :presence => true,
    :uniqueness => true,
    :format => { :with => /^([a-zA-Z0-9_-]+(?:.[a-zA-Z0-9_-]+)*.[a-zA-Z]{2,4}(?:\/[a-zA-Z0-9_]+)*(?:\/[a-zA-Z0-9_]+.[a-zA-Z]{2,4}(?:\?[a-zA-Z0-9_]+\=[a-zA-Z0-9_]+)?)?(?:\&[a-zA-Z0-9_]+\=[a-zA-Z0-9_]+)*)$/i }  

  scope :active, where(:active => '1')
  scope :paid, where(:paid => '1')

  before_save :create_token

  # These need to be distributed every time they're created/updated/deleted.
  after_save :distribute_vcl, :log_updated 
  after_destroy :distribute_vcl, :log_deletion
  after_create :log_addition

  def create_token
    characters = ('a'..'z').to_a
    prefix = (0..1).map{characters.sample}.join
    new_time = Time.now
    new_token = new_time.to_i + rand(new_time.to_i)
    self.token = prefix + new_token.to_s(36) if self.token.blank?
  end

  def distribute_vcl
    varnish = VarnishServer.new
    varnish.distribute
  end

  def log_addition
    CUSTOM_LOGGER.info "Website Added: #{self.weburl}"
  end

  def log_deletion
    CUSTOM_LOGGER.info "Website Removed: #{self.weburl}"
  end

  def log_updated
    CUSTOM_LOGGER.info "Website Updated: #{self.weburl}"
  end

end
