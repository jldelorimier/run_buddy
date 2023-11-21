# == Schema Information
#
# Table name: runs
#
#  id                   :bigint           not null, primary key
#  distance             :float
#  pace                 :integer
#  start_time_beginning :datetime
#  start_time_end       :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_runs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Run < ApplicationRecord
  belongs_to :user
  # belongs_to :matches
  has_many :matches, through: :runs, source: :run1
  has_many :matches, through: :runs, source: :run2
  # has_many :match_run1, class_name: 'Match', foreign_key: 'run1_id'
  # has_many :match_run2, class_name: 'Match', foreign_key: 'run2_id'

  validates :user, presence: true
end

# validate :run_cannot_start_in_the_past
# validate :start_time_end_must_be_after_start_time_beginning
# Todo: create validation for distance cannot be negative

# def run_cannot_start_in_the_past
#   errors.add(:start_time_beginning, "Start time can't be in the past") if
#     start_time_beginning < Time.now
# end

# def start_time_end_must_be_after_start_time_beginning
#   errors.add(:start_time_end, "Start time end must be after start time beginning") if
#     start_time_beginning > start_time_end
# end

# validates :start_time_end, comparison: { greater_than: :start_time_beginning, message: "Start time beginning must be before start time end" }
# validates :start_time_beginning, comparison: { greater_than: :start_time_beginning, message: "Start time beginning must be before start time end" }

# start_time_beginning: 2023-08-25T17:40, start_time_end: 2023-08-26T17:40, distance: 4, minutes: 8, seconds: 15
