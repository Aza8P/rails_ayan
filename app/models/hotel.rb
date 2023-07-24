class Hotel < ApplicationRecord
  belongs_to :user
  validates :destination, presence: true
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :number_of_guests, presence: true
end