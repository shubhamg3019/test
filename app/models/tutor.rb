class Tutor < ApplicationRecord
  belongs_to :course

  validates :name, :specialization, presence: true
end
