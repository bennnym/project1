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
#

class Tweet < ApplicationRecord
end
