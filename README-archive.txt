TODO:

Clear ALL including vhost: curl -d "api_key=ef480be0-2e66-012f-9976-12313d151604" http://app.example.net/cache/tsnh1cls/clear.json -v
Deal with admins clearing caches in API.
Display cache clearing result via AJAX.
Update to Devise 2.0: https://github.com/plataformatec/devise/wiki/How-To:-Upgrade-to-Devise-2.0
	https://github.com/plataformatec/devise/wiki/How-To:-Upgrade-to-Devise-2.0-migration-schema-style
Unconfirmed accounts shouldn't show up in exported vcl.
Show stats for each website hits / bytes
Show sparkline for each website?

BUGS:

Double cache clear in admin interface.
Missing fonts from compiled assets.
Compile assets on-the-fly?
Set Time Zone Properly on Profile page.

LATER:

EMERGENCY PAGE if vcl compile fail.
Procfile/Upstart for all items in production.
Hide "Paid" button unless it's paid - can't have people marking it down on their own.
Show Paid button if you're an admin.
Add ability to admin Users if you're an admin.
Add ability to pay.
Add ability to have diff parts of varnish config files for diff size servers - merge in vhosts.
Cache Clearing: Path is optional and is assumed to be /

MUCH LATER:

Make sure VCL is generate from cluster ID.
Make sure clusters update independently after create / update.
Make sure clusters update independently after delete.

DONE:

Add token - unique token.
Time zone support.
Error messages when unique validation fails aren't shown. (For website.token OR website.url)
Roles aren't working - shouldn't be able to see other peoples unless you're an admin.
Shouldn't see other people's websites in index.
Get VCL without being logged in.
Generate working default.vcl
Seed data locally.
Move to @cloudfoundry: vmc push --runtime ruby19
Seed data on CF? Nope - use Caldecott.
make sure there are is no http:// or / in the url
Fix 404's with Fonts.
Time zones aren't setting right.
Add confirmation email through devise.
Enable Production Confirmation Emails through gmail.
Add email note to "You have signed up successfully."
Confirm password rest works.
Note if you're not confirmed.
Tweak generated VCL so that it doesn't overwhelm origin servers with health checks.
Doesn't kill the last unicorn - needs to kill 1 and keep the other. (cap unicorn:stop; cap unicorn:start)
BUG: A varnish backend cannot start with a number.
Does the generated VCL work?
Don't allow chef-client to re-install old default.vcl.
Redis Munin configs.
Varnish Munin configs.
Create Varnish Server model
Different ports and urls for dev and production.
Push config to Varnish instances - each instance is a different job - use new Varnish_servers model.
Get redis on the box.
Start Resque in production.
Add script to varnish box that looks for new default.vcl, checks for a string and moves it into place - reloads.
Allow vcl user to ssh.
Add key and distribute "vcl" user around with key from "app" user.
Change amount of memory that varnish can use - make sure that it's at least 1GB
Update to Rails 3.2.
NOTE: :public is no longer used to avoid overloading Module#public, use :public_folder instead # Resque bug.
Add cluster to varnish server model.
Make default cluster in DB or Model?
Add cluster to website model.
Password recovery/reset page(s) looks awful.
Confirmation page looks awful.
Profiles page looks awful.
Add ability to push out new config without creating or deleting anything.
Generate APIKEY on signup. https://github.com/assaf/uuid
curl -d "api_key=ef480be0-2e66-012f-9976-12313d151604" http://app.example.net/cache/ymssz4ew/clear.json -v
curl -d "api_key=b67d2cb0-2e65-012f-92b4-3c07541dcd94" http://localhost:3000/cache/fcuf0jpw/clear.json -v
curl -d "api_key=b67d2cb0-2e65-012f-92b4-3c07541dcd94" http://localhost:3000/cache/lbn8rhw8/clear.json -v
API: Pass in domain name and APIKEY.
Add some logging to syslog so that good information can be collected.
Add ability to clear contents of varnishes - using Resque.