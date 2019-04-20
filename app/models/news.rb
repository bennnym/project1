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
end
