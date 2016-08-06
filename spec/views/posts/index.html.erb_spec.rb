require 'rails_helper'
require 'rspec/rails'
require 'devise'


RSpec.describe "posts/index", type: :view do

  let(:post) { FactoryGirl.create(:post) }
  let(:draft) { FactoryGirl.create(:post,title: "Hidden post", draft: true) }
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    assign(:published, [post, post])
    assign(:drafts, [draft])
  end

  context 'When the user is logged in' do

    before(:each) do
      sign_in user, scope: :user
    end
    it 'Show drafts and posts' do
      render
      expect(rendered).to match(draft.title)
      expect(rendered).to match(draft.title)


    end
  end

  context 'When no user is logged' do

    it "renders a list of published posts" do
      render
      assert_select "p.title", :text => post.title.to_s, :count => 2
      # Don't list drafts
      expect(rendered).not_to match(draft.title)
    end
  end
end
