require 'open-uri'

class AuthController < ApplicationController
  def facebook
    @code = params[:code]

    app_id = ""
    redirect_uri = ""
    app_secret = ""

    url = "https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&redirect_uri=#{redirect_uri}&client_secret=#{app_secret}&code=#{@code}"

    @result = open(url).read
  end
end
