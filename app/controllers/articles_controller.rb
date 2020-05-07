class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(created_at:'desc')
  end

  def show
    @Article = Article.find(params[:id])
  end

  def new
    @Article = Article.new
  end

  def create
    @Article = Article.new(article_params)
    if @Article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @Article = Article.find(params[:id])
  end

  def update
    @Article = Article.find(params[:id])
    if @Article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @Article = Article.find(params[:id])
    @Article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
