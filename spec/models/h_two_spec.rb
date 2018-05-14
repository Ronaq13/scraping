require 'rails_helper'

RSpec.describe HTwo do
  it { should belong_to(:url) }
  it { should validate_presence_of(:content) } 
end
