class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article has been created successfully"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def index
    @all_articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article has been updated successfully"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def delete
    @article = Article.find(params[:id])
    @article.destroy
    if @article.exist?
      render :index
    else
      flash[:notice] = "Article has been deleted successfully"
      redirect_to articles_path(@article)
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
