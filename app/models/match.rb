# == Schema Information
#
# Table name: matches
#
#  id         :bigint           not null, primary key
#  run1       :bigint
#  run2       :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Match < ApplicationRecord
  belongs_to :run1, class_name: 'Run', foreign_key: 'run1' # turns out these foreign_key distinctions are key for making it work!!!
  belongs_to :run2, class_name: 'Run', foreign_key: 'run2'
  
  # has_many :runs
  # has_many :users, through: :runs, source: :run1

  validates :run1, uniqueness: { scope: :run2 }
  validates :run2, uniqueness: { scope: :run1 }
end
