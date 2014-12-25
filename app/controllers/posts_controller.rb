class PostsController < ApplicationController
  #before_action :check_fields, only: [:create]

  @@sorting = 'created_at DESC'
  @@per_page = 15

  def index
    @posts = Post.paginate(page: params[:page], per_page: @@per_page).order(@@sorting)
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:success] = "Your post was successfully created"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post was updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to posts_url
  end

  def search
    if params[:query]
      @posts = Post.make_search(params[:query]).paginate(page: params[:page], per_page: @@per_page).order(@@sorting)
    else
      index
    end
    #@posts = Post.make_search(params[:query])
    render "index"
  end

  def help
  end

  def about
  end

  def contact
    @skype_user_name = "mikle.viter"
    @email  = "mikle.viter@gmail.com"
  end

  private

  	def post_params
  		{user_id: 1, post_title: params[:post][:post_title], post_content: params[:post][:post_content]}
   	end
end