require 'nokogiri'
require 'open-uri'

Player.destroy_all

# attempt to get all player data

# get a list of team abreviations to navigate to this years current roster

team_abreviations = %w(ATL BOS BRK CHO CHI CLE DAL DEN DET GSW HOU IND LAC LAL MEM MIA MIL MIN NOP NYK OKC ORL PHI PHO POR SAC SAS TOR UTA WAS)

team_ids = [31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60]

# ATL BOS BRK CHO CHI CLE DAL DEN DET GSW HOU IND LAC LAL MEM MIA MIL MIN NOP NYK OKC ORL PHI

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
team_id = team_ids[index]

### NEED TO FINISH WITH Team.Create etc......

Player.create :first_name => first_name, :last_name => last_name, :games_played => games_played, :ppg => ppg, :trb => trb, :apg => apg, :fgperc => fgperc, :threepperc => threepperc, :ftperc => ftperc, :efgperc => efgperc, :per => per, :ws => ws, :team_id => team_id

puts "Player entered"


end
puts "#{team} succesfully finished" 
end