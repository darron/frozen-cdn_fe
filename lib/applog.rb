#custom_logger.rb
class CustomLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{msg}\n"
  end
end

logfile = File.open(Rails.root + 'log/app.log', 'a')  #create log file
logfile.sync = true  #automatically flushes data to file
CUSTOM_LOGGER = CustomLogger.new(logfile)  #constant accessible anywhere