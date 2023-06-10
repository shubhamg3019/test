require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:tutors) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:duration).is_greater_than(0) }
end
