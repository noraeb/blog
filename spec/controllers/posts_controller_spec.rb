require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    let(:posts) { create_list(:post, 5) }

    it "assigns all posts to @posts" do
      get :index
      expect(assigns(:posts)).to eq posts
    end
  end

end
