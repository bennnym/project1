Team.destroy_all

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

p conference = team_data[4]
p division = team_data[5]
p founded = team_data[6][0..3]
p arena = team_data[8]
p location = team_data[9]
p colors = team_data[10].slice(0...(team_data[10].index('[')))
p general_manager = team_data[12].slice(0...(team_data[12].index('[')))
p president = team_data[13].slice(0...(team_data[13].index('[')))
p coach = team_data[14].slice(0...(team_data[14].index('[')))
p championships = team_data[17][0..1]
p url = 'https://'.concat(team_data[21])
team_name = team
team_name[team_name.index('_')] = ' '
team_name[team_name.index('_')] = ' ' unless team_name.index('_').nil?
p image

Team.create(:name => team_name, :conference => conference, :division => division, :founded => founded, :arena => arena, :location => location, :colors => colors, :general_manager => general_manager, :president => president, :headcoach => coach, :championships => championships, :team_url => url, :logo => image)
end