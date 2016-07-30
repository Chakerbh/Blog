require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  it 'counts number of views' do
    @post = FactoryGirl.create(:post)
    get :show, id: @post
    expect(Post.first.view_count).to eq(1)
    get :show, id: @post
    expect(Post.first.view_count).to eq(2)
  end

  it "doesn't count admin views" do
    @post = FactoryGirl.create(:post)
    @user = FactoryGirl.create(:user)
    get :show, id: @post
    expect(Post.first.view_count).to eq(1)
    sign_in @user, scope: :user
    get :show, id: @post
    expect(Post.first.view_count).to eq(1)
    get :show, id: @post
    expect(Post.first.view_count).to eq(1)

  end



end
