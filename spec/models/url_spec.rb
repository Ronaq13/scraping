require 'rails_helper'

RSpec.describe Url do
  it { should have_many(:h_one).dependent(:destroy) }
  it { should have_many(:h_two).dependent(:destroy) }
  it { should have_many(:h_three).dependent(:destroy) }  
  it { should validate_presence_of(:link) }
  it { should validate_uniqueness_of(:link) }
end
