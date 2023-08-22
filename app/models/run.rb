# == Schema Information
#
# Table name: runs
#
#  id                   :bigint           not null, primary key
#  distance             :float
#  pace                 :integer
#  start_time_beginning :time
#  start_time_end       :time
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
end
