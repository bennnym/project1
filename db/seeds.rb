Team.destroy_all
News.destroy_all
Score.destroy_all
User.destroy_all
Tweet.destroy_all

# Fills Team Model

require 'nokogiri'
require 'open-uri'


team_list = %w(Atlanta_Hawks 
Boston_Celtics 
Brooklyn_Nets
Charlotte_Bobcats 
Chicago_Bulls 
Cleveland_Cavaliers 
Dallas_Mavericks 
Denver_Nuggets 
Detroit_Pistons 
Golden_State_Warriors 
Houston_Rockets 
Indiana_Pacers 
LA_Clippers 
LA_Lakers 
Memphis_Grizzlies 
Miami_Heat 
Milwaukee_Bucks 
Minnesota_Timberwolves 
New_Orleans_Hornets 
New_York_Knicks 
Oklahoma_City_Thunder 
Orlando_Magic 
Philadelphia_76ers 
Phoenix_Suns 
Portland_Trail_Blazers 
Sacramento_Kings 
San_Antonio_Spurs 
Toronto_Raptors 
Utah_Jazz 
Washington_Wizards)




team_list.each do |team|
url = "https://en.wikipedia.org/wiki/".concat(team)
team_data = []
image = ''
# Fetch and parse HTML document
doc = Nokogiri::HTML(open(url))

doc.css('table.infobox.vcard td a img').each do |link| #gets image src
  image = ('https:'.concat(link.attr('src')))
end

doc.css('table.infobox.vcard tr td').each do |link| #gets data
  
  team_data.push(link.content)

end

conference = team_data[4]
division = team_data[5]
founded = team_data[6][0..3]
arena = team_data[8]
location = team_data[9]
colors = team_data[10].slice(0...(team_data[10].index('[')))
general_manager = team_data[12].slice(0...(team_data[12].index('[')))
president = team_data[13].slice(0...(team_data[13].index('[')))
coach = team_data[14].slice(0...(team_data[14].index('[')))
championships = team_data[17][0..1]
url = 'https://'.concat(team_data[21])
team_name = team
team_name[team_name.index('_')] = ' '
team_name[team_name.index('_')] = ' ' unless team_name.index('_').nil?

Team.create(:name => team_name, :conference => conference, :division => division, :founded => founded, :arena => arena, :location => location, :colors => colors, :general_manager => general_manager, :president => president, :headcoach => coach, :championships => championships, :team_url => url, :logo => image)
end

# Fills News Model

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
    return team if string.split.count(team) > 0 
  end
end

def get_news
  api = '50c50a7fed8e419aa10443c203e72c7c'
  url = "https://newsapi.org/v2/everything?language=en&q=NBA&from=#{ DateTime.now.utc.strftime("%Y-%m-%d")}&sortBy=popularity&apiKey=#{ api }"
  
  info = HTTParty.get url
  articles = info["articles"].first(20)
  
  articles.each do |news|
    db_news = News.new
    db_news.source = news["source"]["name"]
    db_news.title = news["title"]
    db_news.description = news["description"]
    db_news.url = news["url"]
    db_news.image = news["urlToImage"]
    db_news.content = news["content"][0...(news["content"].index('['))] # removes the charachter count at the end 
    team_name = team_id_locator(db_news.content)
    if team_name.empty?
      db_news.team_id = 100
    else
      db_news.team_id = Team.where("name like ?", "%#{team_name}%").first.id
    end
    
    db_news.save
  end
end


get_news

# Fills Tweet Model

def get_tweets search_criteria
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "XmTytXBvoo53wQkH1PgeggvEM"
    config.consumer_secret     = "5emA8hVXTerecNr3FCF9rEBX4Jb1WTxfyWV0Zm3ww5UKdP70Rc"
    config.access_token        = "912455494710714368-rHTelxjTlJfxmqzkA23tFdma1TRenBQ"
    config.access_token_secret = "k16jtF2uwOgb6mnX3f2Ssm6ZQoIhSVTBjCnpy1D0a0mzY"
  end

# see https://www.rubydoc.info/gems/twitter/Twitter/REST/Search
client.search("#{ search_criteria } -rt", options = {lang: "en", result_type: "mixed"} ).take(20).each do |tweets|
   twitter_post = Tweet.new
   twitter_post.tweet = tweets.full_text
   twitter_post.favorite = tweets.favorite_count
   twitter_post.language = tweets.lang
   twitter_post.retweet_count = tweets.retweet_count
   twitter_post.url = tweets.url
   #embed the link for display on the site
   url = "https://publish.twitter.com/oembed?url=#{ tweets.url }"
   info = HTTParty.get url
   twitter_post.embed = info["html"]
   twitter_post.save
 end
end

get_tweets

# Fills Score model

def get_scores
  api = '258c806c6c36002827874f0a7bd6f248538eaed3c08eabae8a3dcdf02684f903'
  date = (DateTime.now - 2).strftime("%Y-%m-%d")
  url = "https://allsportsapi.com/api/basketball/?met=Fixtures&APIkey=#{ api }&from=#{ date }&to=#{ date }&leagueId=787"
  info = HTTParty.get url
  games = info["result"]
  
  games.each do |game|
    score = Score.new
    score.home_team = game["event_home_team"]
    score.home_score = game["event_final_result"].first(3)
    score.away_team = game["event_away_team"]
    score.away_score = game["event_final_result"].last(3)
    score.save
  end
  
  get_scores
  
  u1 = User.create :email => 'ben@ga.co', :password => 'chicken', :team_id => 2
  u2 = User.create :email => 'person@ga.co', :password => 'chicken', :team_id => 4