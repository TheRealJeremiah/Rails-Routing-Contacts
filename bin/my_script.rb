require 'addressable/uri'
require 'rest-client'

# bin/my_script.rb
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/3'
).to_s


# puts RestClient.get(url)
begin
  puts RestClient.delete(url)
rescue Exception => e
  puts e
end
