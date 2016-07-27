require 'rails_helper'

RSpec.describe "posts/show", type: :view do

  it "renders to markdown" do
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end

end
