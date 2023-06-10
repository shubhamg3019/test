require 'rails_helper'

RSpec.describe Tutor, type: :model do
  it { should belong_to(:course) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:specialization) }
end
