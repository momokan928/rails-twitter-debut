class RepliesController < ApplicationController
  def create
    @Article= Article.find(params[:article_id])
    @Article.replies.create(reply_params)
    redirect_to article_path(@Article)
  end


  private
    def reply_params
      params.require(:reply).permit(:name,:body)
    end

end
