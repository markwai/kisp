class ArticlesController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @article = Article.all.order("created_at desc")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    @article.user = current_user

    if @article.save
      flash[:success] = 'Article created.'
      redirect_to root_path
    else
      flash[:error] = "Failed to create article"
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    
  end

  private 

  def articles_params
    params.require(:article).permit(:title,:url,:published_on,:author)
  end

end