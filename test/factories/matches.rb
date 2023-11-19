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
FactoryBot.define do
  factory :match do
    run1 { "" }
    run2 { "" }
  end
end
