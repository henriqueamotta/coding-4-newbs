class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # verifica a autenticação do admin para criar, excluir e editar terms
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show] # dupla verificação para autenticar o admin

  def index
    @articles = policy_scope(Article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :content, :term_id)
  end
end
