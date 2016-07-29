require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  it 'counts number of views' do
    @post = FactoryGirl.create(:post)
    get :show, id: @post
    expect(Post.first.view_count).to eq(1)
    get :show, id: @post
    expect(Post.first.view_count).to eq(2)
  end



end
