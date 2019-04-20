# == Schema Information
#
# Table name: teams
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  conference      :string
#  division        :string
#  founded         :string
#  arena           :string
#  location        :string
#  colors          :string
#  general_manager :string
#  president       :string
#  headcoach       :string
#  championships   :string
#  team_url        :text
#  logo            :text
#

class Team < ActiveRecord::Base
  has_many :users
end
