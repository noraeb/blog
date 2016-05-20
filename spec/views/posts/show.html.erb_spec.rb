require 'rails_helper'

RSpec.describe "posts/show.html.erb", type: :view do
let(:post) { FactoryGirl.create(:post)}

  before do
    assign(:post, post)
    render
  end

  it "renders the content of the post" do
    assert_select "p", text: post.content, count: 1
  end


end
