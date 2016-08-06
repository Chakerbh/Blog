require 'rails_helper'
require 'spec_helper'

RSpec.describe "posts/show", type: :view do

  let(:post) { FactoryGirl.create(:post) }
  let(:markdown_post) { FactoryGirl.create( :post, body: '#This is markdown')}
  let(:user) { FactoryGirl.create :user }

  it "renders markdown" do
    @post = assign(:post, markdown_post)
    render
    expect(rendered).to match(@post.title)
    expect(rendered).to match(/<h1>This is markdown<\/h1>/)
  end

  before(:each) do
    @post = assign(:post, post)
    sign_in user, scope: :user
  end

  it "renders attributes the post" do
    render
    expect(rendered).to match(@post.title)
    expect(rendered).to match(@post.body)
  end

  it "show number of views" do
    render
    expect(rendered).to match(/viewed \d/)
  end


end
