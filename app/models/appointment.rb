class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
  has_many :treatments, dependent: :destroy

  validates :date, :reason, :status, presence: true

  enum :status, {
    scheduled: 0,
    in_progress: 1,
    completed: 2,
    cancelled: 3
  }

  scope :upcoming, -> {
    where("date > ?", Time.current).order(date: :asc)
  }

  scope :past, -> {
    where("date < ?", Time.current).order(date: :desc)
  }
end