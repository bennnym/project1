# == Schema Information
#
# Table name: scores
#
#  id         :bigint(8)        not null, primary key
#  home_team  :text
#  home_score :integer
#  away_team  :text
#  away_score :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Score < ApplicationRecord
end
