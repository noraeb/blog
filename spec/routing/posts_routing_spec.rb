require 'rails_helper'

RSpec.describe PostsController, type: :routing do
    describe "Routing" do
      it "routes to posts#index" do
        expect(get: "/").to route_to("posts#index")
      end

      it "routes to posts#show" do
        expect(get: "/posts/1").to route_to("posts#show", id: "1")
      end

      it "routes to #create" do
      expect(:post => "/posts").to route_to("posts#create")
    end
    end
end
