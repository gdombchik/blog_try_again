class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      #redirect to the article show page.  get article
      redirect_to @article
    else
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect
    #@article = params[:article][:title]
    #redirect_to @article
    #@test = params[:article][:title]

    @article = Article.new(article_params)
    if @article.save
      #redirect to the article show page.  get article
      redirect_to @article
    else
      render 'new'
    end
  end
  def hello

  end

  private

  def article_params
    params.require(:article).permit(:title,:text)
  end
end
