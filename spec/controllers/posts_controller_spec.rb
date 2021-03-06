require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    let(:posts) { create_list(:post, 2  ) }

    it "assigns all posts to @posts" do
      get :index
      expect(assigns(:posts)).to eq posts
    end
  end

  describe "GET #show" do
    let(:post) { FactoryGirl.create(:post) }

    it "assigns the requested post as @post" do
      get :show, { id: post.to_param }
      expect(assigns(:post)).to eq post
    end
  end


  let(:user) { FactoryGirl.create(:user, admin: true) }

  let(:valid_attributes) do
  { title: "Title", content: "So many tests!!", user: user }
  end

  let(:invalid_attributes) do
  { title: "" }
  end

  describe "POST #create" do

    context "when logged in" do
      login_user

      context "with valid params" do

        it "creates a new Post" do
          expect {
            post :create, {post: valid_attributes}
          }.to change(Post, :count).by(1)
        end

        it "assigns a new created post as @post" do
          post :create, {post: valid_attributes}
          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
        end

        it "redirects to the created post" do
          post :create, {post: valid_attributes}
          expect(response).to redirect_to(root_url)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved post as @post" do
          post :create, {post: invalid_attributes}
          expect(assigns(:post)).to be_a_new(Post)
        end

        it "re-renders the 'new' template" do
          post :create, {post: invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end
  end

    describe "DELETE #destroy" do
      let!(:post) { FactoryGirl.create(:post) }

      context "when logged in" do
        login_user

        it "destroys an existing post" do
        expect { delete :destroy , { id: post.to_param }
        }.to change(Post, :count).by(-1)
      end
    end
  end
end
