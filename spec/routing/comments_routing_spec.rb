require 'rails_helper'

RSpec.describe CommentsController, type: :routing do
    describe "Routing" do
      it "routes to comments#index" do
        expect(get: "/posts/1/comments").to route_to("comments#index", post_id: "1")
      end

      it "routes to comments#show" do
        expect(get: "/posts/1/comments/1").to route_to("comments#show", post_id: "1", id: "1")
      end

      it "routes to comments#create" do
      expect(:post => "/posts/1/comments").to route_to("comments#create", post_id: "1")
    end

    it "routes to comments#destroy" do
      expect(:delete => "/posts/1/comments/1").to route_to("comments#destroy", post_id: "1", id: "1")
    end

    it "routes to comments#new" do
      expect(get: "/posts/1/comments/new").to route_to("comments#new", post_id: "1")
    end


    end
end
