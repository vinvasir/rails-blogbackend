class V1::PostsController < ApplicationController
	def index
		render json: {posts: []}
	end
end