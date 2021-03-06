class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article has been created successfully"
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def index
    @all_articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article has been updated successfully"
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article has been deleted successfully"
    redirect_to articles_path
  end

  private
    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end
