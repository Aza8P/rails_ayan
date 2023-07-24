class Train < ApplicationRecord
  belongs_to :user
  validates :destination, presence: true
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }
end
