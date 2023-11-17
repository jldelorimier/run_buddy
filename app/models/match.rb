class Match < ApplicationRecord
  belongs_to :run1, class_name: 'Run', foreign_key: 'run1_id'
  belongs_to :run2, class_name: 'Run', foreign_key: 'run2_id'

  validates :run1, uniqueness: { scope: :run2 }
  validates :run2, uniqueness: { scope: :run1 }
end
