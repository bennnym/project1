Team.destroy_all
User.destroy_all


# Fills Team Model scraping from wikipedia

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


  # Create a couple of users
  
  u1 = User.create :email => 'ben@ga.co', :password => 'chicken', :team_id => 2
  u2 = User.create :email => 'person@ga.co', :password => 'chicken', :team_id => 4
  
  ##### This adds all of the players to the db, scraped from basketballreference.com - takes about 15 minutes to run ####
  
  Player.destroy_all

  # attempt to get all player data

  # get a list of team abreviations to navigate to this years current roster

  team_abreviations = %w(ATL BOS BRK CHO CHI CLE DAL DEN DET GSW HOU IND LAC LAL MEM MIA MIL MIN NOP NYK OKC ORL PHI PHX POR SAC SAS TOR UTA WAS)


  #navigate to this years roster and obtain a list of the links of current players sites



  team_abreviations.each_with_index do |team,index|
  url = "https://www.basketball-reference.com/teams/#{team}/2019.html"

  player_links = []

  ##### PLAYER
  # Fetch and parse HTML document

  doc = Nokogiri::HTML(open(url))


  doc.css('table#roster tbody td[data-stat="player"] a').each do |link| #gets image src
    player_links.push("https://www.basketball-reference.com".concat(link.attr('href'))) #this gives the link to the player

  end

  doc = Nokogiri::HTML(open(url))

  teamname = []

  doc.css('h1 span').each_with_index do |link, index| 
    teamname.push(link.text)
  end

  puts team_name = teamname[1]

  player_links.each do |player_url|

  doc = Nokogiri::HTML(open(player_url))

  name = []

  doc.css("h1").each do |link| #gets image src
    name.push(link.text)
  end

  name = name[0]

  puts "name = #{name}"

  player_stats = []

  # "table#per_game tbody th a"
  doc.css(".stats_pullout p").each do |link| #gets image src
    player_stats.push(link.text)
  end

  puts first_name = name.split(' ')[0] 
  puts last_name = name[(first_name.length+1)..(name.length)]
  games_played = player_stats[2]
  ppg = player_stats[4]
  trb = player_stats[6]
  apg = player_stats[8]
  fgperc = player_stats[10]
  threepperc = player_stats[12]
  ftperc = player_stats[14]
  efgperc = player_stats[16]
  per = player_stats[18]
  ws = player_stats[20]
  team_id = index + 1

  ### NEED TO FINISH WITH Team.Create etc......

  Player.create :first_name => first_name, :last_name => last_name, :games_played => games_played, :ppg => ppg, :trb => trb, :apg => apg, :fgperc => fgperc, :threepperc => threepperc, :ftperc => ftperc, :efgperc => efgperc, :per => per, :ws => ws, :team_id => team_id

  puts "Player entered"


  end
  puts "#{team} succesfully finished" 
  end