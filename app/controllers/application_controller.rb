require 'uri'
require 'net/http'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  url = URI("https://api.dexcom.com/v1/oauth2/token")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Post.new(url)
  request["content-type"] = 'application/x-www-form-urlencoded'
  request["cache-control"] = 'no-cache'
  request.body = "client_secret={bD0DUvp3qfdeZseV}&client_id={YyGrSR2qJw0sGAPH5dTOAvVoV5Lb2obw}&code={your_authorization_code}&grant_type=authorization_code&redirect_uri={your_redirect_uri}"

  response = http.request(request)
  puts response.read_body
end
