# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  has_many :runs
  has_many :matches, through: :runs
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end

# has_many :matches, ->(user) { 
#   unscope(where: :user_id) # removes the implicit `where` association created by Rails due to the has_many :matches association; by default, this would create an assocation between Users and Matches like where(matches: { user_id: user.id }). We need to remove this assocation because users don't direclty have matches. Users have matches through runs. 
#     # V1
#     # .where('run1.user = ? OR run2.user = ?', user.id, user.id) 
#     # V2
#     .joins('INNER JOIN runs AS run1 ON run1.id = matches.run1')
#     .joins('INNER JOIN runs AS run2 ON run2.id = matches.run2')
#     .joins('INNER JOIN users AS user1 ON user1.id = run1.user_id')
#     .joins('INNER JOIN users AS user2 ON user2.id = run2.user_id')
#     .where('user1.id = ? OR user2.id = ?', user.id, user.id)
#     # V3
#     # .joins(run1: :user, run2: :user)
#       # .where('users.id = ? OR users.id = ?', user.id, user.id)
#       # .where('run1.user_id = :user_id OR run2.user_id = :user_id', user_id: user.id) # `run1.user_id` and `run2.user_id` are giving me an ActiveRecord error
#   }, class_name: 'Match', foreign_key: 'run1' #Chad says to change to foreign_key to 'run1_user_id'
# # Include default devise modules. Others available are:
# # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable