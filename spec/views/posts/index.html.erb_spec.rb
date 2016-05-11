require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  let(:posts) { create_list(:post, 3)}

  context "When not logged in" do
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

    it "shows link to admin login" do
      assert_select "#admin_link"
    end

    it "doesn't show link to admin log out if not logged in " do
      assert_select "#admin_logout_link", false
    end
  end

  context "when logged in" do
    let(:admin) { FactoryGirl.create(:admin) }
    login_admin

    before(:each) do
      assign(:posts, posts)
      assign(:post, Post.new)

      render
    end

      it "shows link admin logout" do
        assert_select "#admin_logout_link"
      end

      it "shows link new post" do
        assert_select "#new_link"
      end
    end
end
