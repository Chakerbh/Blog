require 'rails_helper'

RSpec.describe User, type: :model do
  it "Should create new user" do
    User.create!(FactoryGirl.attributes_for(:user))
  end
end

