require 'rails_helper'
require 'rspec/rails'
require 'devise'


RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title1",
        :body => "MyText",
      ),
      Post.create!(
        :title => "Title1",
        :body => "MyText",
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "p.title", :text => "Title1".to_s, :count => 2
  end
end
