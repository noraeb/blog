require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { is_expected.to have_many(:posts) }
end
