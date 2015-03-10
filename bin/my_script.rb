require 'addressable/uri'
require 'rest-client'

# bin/my_script.rb
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/comments'
).to_s


# puts RestClient.get(url)
begin
  puts RestClient.post(url, { comment: { author_id: 4, commentable_id: 1, commentable_type: 'User', body: 'something else' } })
rescue Exception => e
  puts e
end
