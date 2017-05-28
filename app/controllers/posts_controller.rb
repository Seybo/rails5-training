class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.xls { render xls: generate_xls(@post) }
    end
  end
end
