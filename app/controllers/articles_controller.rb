class ArticlesController < ApplicationController

before_action :move_to_index, except: :index

  def index
    @articles = Article.page(params[:page]).per(4).order("created_at DESC")
    end

   def update
      article = Article.find(params[:id])
      if article.user_id == current_user.id
        article.update(article_params)
      end
    end




  def new
      @articles = Article.new
    end

  def create
    Article.create(text: article_params[:text],user_id: current_user.id)
  end

  def destroy
      article = Article.find(params[:id])
      if article.user_id == current_user.id
        article.destroy
      end
    end

   def edit
      @article = Article.find(params[:id])
    end



  private
    def article_params
      params.require(:article).permit(:text)
    end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end








# (name: "", image: "", text: "")
