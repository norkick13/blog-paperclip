class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy] # Before the routes get run this will find the post for  show, edit, destroy and update actions
  def index
  	@post = Post.all.order("created_at DESC") #this will grab all our posts from model post and arrange them by descinding order and we are assigning each of our post to @post variable
  end
  def new
  	@post=Post.new
  end
  def create 
  	@post = Post.new(post_params) #this is security measure that rails implements	
  	if @post.save
  		redirect_to @post #if post is saved then we want to render to post show page 
  	else
  		render'new'
  	end
  end

  def show
  	#@post = Post.find(params[:id]) #this will find the post according to the ID, but we should remove it because to avoid repetion we will use find_post method 
  end
  def update
  #@post = Post.find(params[:id])#this will find the post according to the ID, but we should remove it because to avoid repetion we will use find_post method 
  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end	
  end
  def edit
  	#@post = Post.find(params[:id])#this will find the post according to the ID, but we should remove it because to avoid repetion we will use find_post method 
  end 
  def destroy 
  	#@post = Post.find(params[:id])#this will find the post according to the ID, but we should remove it because to avoid repetion we will use find_post method 
  	@post.destroy
  	render_to root_path  #this will redirect to home page
  end



  private
  def find_post
  	@post = Post.find(params[:id]) #this will find post 
  end

  def post_params  #def what above post_param is
  	params.require(:post).permit(:title, :body) # we add two attributes as body and text, what attributes you need to save, create and updat eon the model
  end

end


