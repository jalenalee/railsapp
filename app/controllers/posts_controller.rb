class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @title = @post.title
    @author_first_name = @post.user.first_name
    @author_last_name = @post.user.last_name
    @date = @post.date
    @content = @post.content
    @category = @post.category.name
    @tags = @post.tags
    @comments = @post.comments
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Instance variable => @ meaning it can be used inside the action method and the action view
  # e.g. @posts = Post.all in def stats, means within that method and in stats.html.erb as long as
  # under the posts directory because the controller is posts.
  # Local variable => means only within the method.
  def stats
  # The top 5 most used tags 
  # Create a table 
    # @top_tag = Tagging.group(:tag_id).order('COUNT(*) DESC').limit(5)
    # Select (this grabs all the children inside the top tag table)
    # single quotes mean injecting SQL 
    @tags = Tag.joins(:taggings).group('taggings.tag_id').select('tags.*,COUNT(*) as tagging').order('tagging DESC').limit(5)


  # The user with the most number of authored posts and the associated count
    @number_of_posts = Post.group(:user_id).select('*, COUNT(*) AS counter').order('counter DESC').first.counter 
    # You want the first one of the table count 
    @user_with_most_posts = Post.group(:user_id).select('*, COUNT(*) AS counter').order('counter DESC').first.user.first_name 
    # @most_post = Post.group(:user_id).order(‘COUNT(*) DESC’).count()

  # The title of the longest blog post by character count
    @longest_blog_post_by_character_count = Post.order('LENGTH(content) DESC').first.title 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :date)
    end
end
