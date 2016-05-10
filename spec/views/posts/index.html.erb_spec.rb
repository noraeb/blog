require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  let(:posts) { create_list(:post, 3)}

  before(:each) do
    assign(:posts, posts)
    assign(:post, Post.new)

    render
  end


  it "shows a title" do
    assert_select "h1", text: "Nora's Blog", count: 1
  end

  it "renders all posts" do
    assert_select "div.post", count: posts.count

    posts.each do |post|
      assert_select ".post>h2", text: post.title, count: 1
    end
  end

  let(:post) { FactoryGirl.post(create) }
  it "renders new post form" do
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "textarea#post_title[name=?]", "post[title]"
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#[type=?][value=?]", "submit", "Create Post"
    end
  end
end
