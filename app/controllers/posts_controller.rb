class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # Post.create(params[:post])
    @post = Post.new
    # @post.title = params[:post][:title] # allowed
    # @post.body = params[:post][:body]
    # @post.save!
    # @post.update_attributes!(params.fetch(:post)) # not allowed
    # @post.update_attributes!(params.require(:post).slice(:title, :body)) # not allowed
    # @post.update_attributes!(params[:post].permit(:title, :body)) # allowed
    @post.update_attributes!(title: params[:post][:title], body: params[:post][:body]) # allowed
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.xls { render xls: generate_xls(@post) }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
