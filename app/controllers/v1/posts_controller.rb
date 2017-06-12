class V1::PostsController < ApplicationController
	before_action :find_post, only: [:show, :update, :edit, :destroy]

	def index
		render json: {posts: Post.all}
	end

	def show
		render json: {post: @post}
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			render json: {post: @post}
		else
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@post.destroy
		render json: {"success": "deleted post"}
	end

	private

		def post_params
			params.require(:post).permit(:title, :categories, :content)
		end

		def find_post
			@post = Post.find(params[:id])
		end
end