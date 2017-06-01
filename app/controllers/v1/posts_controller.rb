class V1::PostsController < ApplicationController
	def index
		render json: {posts: Post.all}
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			render json: {post: @post}
		else
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	private

		def post_params
			params.require(:post).permit(:title, :categories, :content)
		end
end