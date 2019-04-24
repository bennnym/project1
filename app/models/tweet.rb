# == Schema Information
#
# Table name: tweets
#
#  id            :bigint(8)        not null, primary key
#  tweet         :text
#  favorite      :integer
#  language      :string
#  retweet_count :integer
#  url           :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  embed         :text
#  team_id       :integer
#

class Tweet < ApplicationRecord
  belongs_to :team, :optional => true
  
  def get_tweets search_criteria
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end
  
  # see https://www.rubydoc.info/gems/twitter/Twitter/REST/Search
  client.search("#{ search_criteria } -rt", options = {lang: "en", result_type: "mixed"} ).take(15).each do |tweets|
     twitter_post = Tweet.new
     twitter_post.tweet = tweets.full_text
     twitter_post.favorite = tweets.favorite_count
     twitter_post.language = tweets.lang
     twitter_post.retweet_count = tweets.retweet_count
     twitter_post.url = tweets.url
     team_name = team_id_locator(twitter_post.tweet) #find the team the post is about
     if team_name.empty?
       twitter_post.team_id = nil
     else
       twitter_post.team_id = Team.where("name like ?", "%#{team_name}%").first.id
     end
     #embed the link for display on the site
     url = "https://publish.twitter.com/oembed?url=#{ tweets.url }"
     info = HTTParty.get url
     twitter_post.embed = info["html"]
     twitter_post.save
   end
  end
  
  def team_id_locator string  #This method searches the news content and finds which team the news is about in order to associate the news with that team
    
    team_list = %w(Hawks 
    Celtics 
    Nets
    Bobcats 
    Bulls 
    Cavaliers 
    Mavericks 
    Nuggets 
    Pistons 
    Warriors 
    Rockets 
    Pacers 
    Clippers 
    Lakers 
    Grizzlies 
    Heat 
    Bucks 
    Timberwolves 
    Hornets 
    Knicks 
    Thunder 
    Magic 
    76ers 
    Suns 
    Blazers 
    Kings 
    Spurs 
    Raptors 
    Jazz 
    Wizards)

    team_list.select do |team| 
      if string.split.count(team) > 0 
        return team 
      elsif string.split.count(team.downcase) > 0
        return team
      elsif string.split.count("#".concat(team)) > 0
        return team
    end
  end
  end
  
  
end
