class ArticlesController < ApplicationController

http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

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

  def create
    @article = Article.new(article_params)

    if @article.save
    #how is it redirecting?
      redirect_to @article, notice: "You have successfully logged out"
    # smart parameters to prevent someone from maybe creating a key like :is_admin
    # render plain: params[:article].inspect
    # @article = Article.new(params[:article])
  else
    render 'new'
  end
    # @article.save
    #   redirect_to @article
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
