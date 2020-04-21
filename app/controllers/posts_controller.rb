class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  		flash[:success] = "poste cree avec succes!"
  		redirect_to posts_path
  	else
  		render :new
  	end
  end

  def index
  	@posts = Post.all
  end

  private
  	def post_params
  		params.require(:post).permit(:content) 
  	end
end
