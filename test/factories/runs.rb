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
FactoryBot.define do
  factory :run do
    start_time_beginning { "2023-08-21 16:47:41" }
    start_time_end { "2023-08-21 16:47:41" }
    distance { 1.5 }
    pace { 1 }
    user { nil }
  end
end
