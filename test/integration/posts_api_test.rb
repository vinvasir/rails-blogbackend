require 'test_helper'

class PostsApiTest < ActionDispatch::IntegrationTest
	context "with no posts" do
		should "get 200 but be blank" do
			get "/v1/posts"

			assert_response :success

			json = JSON.parse(response.body)

			assert_equal json["posts"].length, 0
		end
	end

	context "with some posts" do
		setup do
			5.times { FactoryGirl.create(:post) }
		end

		should "display all posts" do
			get "/v1/posts"

			assert_response :success

			json = JSON.parse(response.body)

			assert_equal json["posts"].length, 5
		end
	end
end
