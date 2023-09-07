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
  validates :user, presence: true
  # validate :run_cannot_start_in_the_past
  # validate :start_time_end_must_be_after_start_time_beginning

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
end
