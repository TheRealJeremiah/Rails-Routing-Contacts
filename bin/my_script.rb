require 'addressable/uri'
require 'rest-client'

# bin/my_script.rb
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contact_shares'
).to_s


# puts RestClient.get(url)
begin
  puts RestClient.post(url, { contact_share: { user_id: 4, contact_id: 3} })
rescue Exception => e
  puts e
end
