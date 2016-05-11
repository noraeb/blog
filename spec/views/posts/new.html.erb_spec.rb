require 'rails_helper'

RSpec.describe "posts/new.html.erb", type: :view do
  let(:post) { FactoryGirl.post(create) }
  it "renders new post form" do
    assert_select "form[action=?][method=?]", new_post_path, "post" do
      assert_select "textarea#post_title[name=?]", "post[title]"
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#[type=?][value=?]", "submit", "Create Post"
    end
  end

end
