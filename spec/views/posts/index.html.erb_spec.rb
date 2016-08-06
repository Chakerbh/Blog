require 'rails_helper'
require 'rspec/rails'
require 'devise'


RSpec.describe "posts/index", type: :view do

  let(:post) { FactoryGirl.create(:post) }


  before(:each) do
    assign(:posts, [post, post])
  end

  it "renders a list of posts" do
    render
    assert_select "p.title", :text => post.title.to_s, :count => 2
  end
end
