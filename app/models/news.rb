# == Schema Information
#
# Table name: news
#
#  id          :bigint(8)        not null, primary key
#  source      :text
#  title       :text
#  description :text
#  url         :text
#  image       :text
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :integer
#

class News < ApplicationRecord
  belongs_to :news, :optional => true
  
  def get_news

    api = '50c50a7fed8e419aa10443c203e72c7c'
    url = "https://newsapi.org/v2/everything?language=en&q=NBA&from=#{ DateTime.now.utc.strftime("%Y-%m-%d")}&sortBy=popularity&apiKey=#{ api }"
    
    info = HTTParty.get url
    articles = info["articles"]
    
    articles.each do |news|
      db_news = News.new
      db_news.source = news["source"]["name"]
      db_news.title = news["title"]
      db_news.description = news["description"]
      db_news.url = news["url"]
      db_news.image = news["urlToImage"]
      if news["content"].present?
        db_news.content = news["content"][0...(news["content"].index('['))]  # removes the charachter count at the end 
        team_name = team_id_locator(db_news.content)
      else
        team_name = nil
      end
      
      if team_name.nil? || team_name.empty?
        db_news.team_id = nil
      else
        db_news.team_id = Team.where("name like ?", "%#{team_name}%").first.id
      end
      
      db_news.save
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
      return team if string.split.count(team) > 0 || string.split.count(team.downcase) > 0
    end
  end
  
end
