require 'test_helper'

class PostsApiTest < ActionDispatch::IntegrationTest
	context "with no posts" do
		should "get 200 but be blank" do
			get "/v1/posts"

			assert_response :success

			json = JSON.parse(respone.body)

			assert_equal json[:posts].length) 0
		end
	end
  # test "the truth" do
  #   assert true
  # end
end
