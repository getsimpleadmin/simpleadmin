require 'spec_helper'

RSpec.describe SimpleAdmin::Category, type: :model do
  it { should validate_presence_of(:title) }
end
