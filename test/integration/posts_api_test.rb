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

		should "add a new post and display it at the end of the index route" do
			post "/v1/posts", params: { post: {
				title: Faker::Lorem.sentence,
				categories: Faker::Lorem.words.join(' '),
				content: Faker::Lorem.paragraph	
			}}

			assert_response :success

			json = JSON.parse(response.body)

			assert_equal json["post"]["title"], Post.last.title

			get "/v1/posts"

			json = JSON.parse(response.body)

			assert_equal json["posts"].length, 6

			assert_equal json["posts"][5]["content"], Post.last.content
		end
	end
end
