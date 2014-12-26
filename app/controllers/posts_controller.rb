class PostsController < ApplicationController
  #before_action :check_fields, only: [:create]

  @@sorting = 'created_at DESC'

  def index
    @def_per_page, @per_page, @per_page_nums = get_per_page
    @query = get_query
    @posts = Post.paginate(page: params[:page], per_page: @per_page).order(@@sorting)
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
    @def_per_page, @per_page, @per_page_nums = get_per_page
    @query = get_query
    if params[:query] && !params[:query].to_s.strip.empty?
      @posts = Post.make_search(params[:query]).paginate(page: params[:page], per_page: @per_page).order(@@sorting)
      render "index"
    else
      redirect_to root_url
    end
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

    def get_per_page
      @default_per_page = 30
      @per_page_nums = ["15","30","50"]
      if params[:per_page].nil?
        return @default_per_page, @default_per_page, @per_page_nums
      else
        if @per_page_nums.include? params[:per_page]
          return @default_per_page, params[:per_page], @per_page_nums
        else
          return @default_per_page, @default_per_page, @per_page_nums
        end
      end
    end

    def get_query
      if params[:query].nil?
        ""
      else
        "&query=#{params[:query]}"
      end
    end
end