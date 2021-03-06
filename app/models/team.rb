# frozen_string_literal: true

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
  has_many :news
  has_many :tweets
  has_many :players

  def validate_player(string)
    first_name = string.split(' ').first
    last_name = string[(string.index(' ') + 1)..string.length - 1]
    name = {
      first_n: first_name,
      last_n: last_name
    }
  end
end
