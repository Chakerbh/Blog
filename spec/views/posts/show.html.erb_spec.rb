require 'rails_helper'
require 'spec_helper'

RSpec.describe "posts/show", type: :view do

  it "renders markdown" do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :body => "# This is markdown",
    ))
    render 
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/<h1>This is markdown<\/h1>/)
  end

  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :body => "MyText",
      :view_count => 2,
    ))
    @user = assign(:user, FactoryGirl.create(:user))
    sign_in @user, scope: :user
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end

  it "count number of views" do
    render
    expect(rendered).to match(/viewed 2/)
  end


end
