require 'rails_helper'

RSpec.describe "posts/show.html.erb", type: :view do
let(:post) { FactoryGirl.create(:post)}

before do
  assign(:post, post)
  render
end

  it "renders the post title " do
    assert_select "h1", text: post.title, count: 1
  end

  it "renders the created_at_date of post " do
    assert_select "p", text: post.created_at, count: 1
  end

  it "renders the content of the post" do
      assert_select "p", text: post.content, count: 1
  end
end
