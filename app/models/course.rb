class Course < ApplicationRecord
  has_many :tutors, dependent: :destroy
  accepts_nested_attributes_for :tutors

  validates :name, presence: true, uniqueness: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
end
