require 'rails_helper'


RSpec.describe RegistrationsController, type: :controller do

  context "Admin already registred" do
    it "cannot create new user" do
      @user_attr = FactoryGirl.attributes_for(:user)
      # Create Admin
      User.create!(@user_attr)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, user: @user_attr
      expect(User.count).to eq(1)

    end
  end
end
