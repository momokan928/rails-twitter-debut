class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(created_at:'desc')
  end

  def show
    @Article = Article.find(params[:id])
  end

  def new

  end

  def create
    @Article = Article.new(article_params)
    @Article.save
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
