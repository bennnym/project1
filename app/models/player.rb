# == Schema Information
#
# Table name: players
#
#  id           :bigint(8)        not null, primary key
#  first_name   :text
#  last_name    :text
#  games_played :text
#  ppg          :integer
#  trb          :integer
#  apg          :integer
#  fgperc       :integer
#  threepperc   :integer
#  ftperc       :integer
#  efgperc      :integer
#  per          :integer
#  ws           :integer
#  team_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Player < ApplicationRecord
  belongs_to :team, :optional => true
end
