require 'open-uri'

desc "Greeting"
task :howdy do
  puts "Howdy!"
end

desc "Introduce"
task :intro => :howdy do
  puts "My name is Raghu"
end



desc "Refresh friend lists"
task :poll_facebook => :environment do
  User.find_each do |user|
    url = "https://graph.facebook.com/me/friends?fields=name,id,location&access_token=#{user.facebook_access_token}"

    result = JSON.parse(open(url).read)

    friends = result["data"]

    # OPTIMIZE this should be a map/create
    friends.each do |friend_hash|
      if friend_hash["location"].present?
        f = Friend.new
        f.name = friend_hash["name"]
        f.facebook_id = friend_hash["id"]
        f.location = friend_hash["location"]["name"]
        f.user = user
        f.save
        puts "Created friend #{f.name}"
      end
    end
  end
end
