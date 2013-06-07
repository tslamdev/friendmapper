require 'open-uri'

class AuthController < ApplicationController
  def facebook
    code = params[:code]

    app_id = "1375153749364030"
    redirect_uri = "http://localhost:3000/auth/facebook"
    app_secret = "594004c7fda93757d15612b7a083dfa2"

    url = "https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&redirect_uri=#{redirect_uri}&client_secret=#{app_secret}&code=#{code}"

    result = open(url).read

    access_token = result.split("&").first.split("=").last

    current_user.facebook_access_token = access_token

    me_url = "https://graph.facebook.com/me?access_token=#{access_token}"

    me_result = JSON.parse(open(me_url).read)

    current_user.facebook_id = me_result["id"]
    current_user.name = me_result["name"]

    current_user.save

    redirect_to current_user
  end
end







