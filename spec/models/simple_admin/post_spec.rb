require 'spec_helper'

RSpec.describe SimpleAdmin::Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
