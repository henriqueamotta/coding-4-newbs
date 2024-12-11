class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?

  def index
    @articles = policy_scope(Article)
    if params[:query].present?
      @articles = @articles.where("name ILIKE ? OR content ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    # Artigo em destaque(o mais recente)
    @featured_article = @articles.order(created_at: :desc).first

    # Outros artigos excluindo o destaque

    if @featured_article
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}))
      @featured_article_content_html = markdown.render(@featured_article.content).html_safe
    end

    @articles = @articles.where.not(id: @featured_article.id) if @featured_article

    @articles_content_html = {}

    @articles.each do |article|
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}))
      @articles_content_html[article.id] = markdown.render(article.content).html_safe
    end
  end

  def show
    authorize @article
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}))
    @content_html = markdown.render(@article.content).html_safe
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def home
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :content, :term_id)
  end
end
