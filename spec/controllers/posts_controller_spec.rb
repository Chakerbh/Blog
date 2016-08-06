require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  let(:post) { FactoryGirl.create :post }
  let(:user) { FactoryGirl.create :user }

  context "when no user is logged in" do
    it 'counts number of views' do
      get :show, id: post
      expect(Post.first.view_count).to eq(1)
      get :show, id: post
      expect(Post.first.view_count).to eq(2)
    end
  end

  context "when the admin is logged in" do
    it "doesn't count views" do
      get :show, id: post
      expect(Post.first.view_count).to eq(1)
      sign_in user, scope: :user
      get :show, id: post
      expect(Post.first.view_count).to eq(1)
      get :show, id: post
      expect(Post.first.view_count).to eq(1)
    end
  end
end
