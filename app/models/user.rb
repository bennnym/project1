# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :text
#  password_digest :text
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  team_id         :integer
#

class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
   # (cant create a User without an email and has to be unique in the db)
   belongs_to :team, :optional => true
   has_and_belongs_to_many :players, -> { distinct }
end
