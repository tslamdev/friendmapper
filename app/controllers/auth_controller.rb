require 'open-uri'

class AuthController < ApplicationController
  def facebook
    @code = params[:code]

    app_id = "1375153749364030"
    redirect_uri = "http://localhost:3000/auth/facebook"
    app_secret = "1dd681ba564eb102fd913583a4ed3678"

    url = "https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&redirect_uri=#{redirect_uri}&client_secret=#{app_secret}&code=#{@code}"

    @result = open(url).read

    # Now, write some Ruby to extract from @result just the access token and store it in the database for the signed-in user (there is a column in the users table called 'facebook_access_token').
  end
end
