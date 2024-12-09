class ForumsController < ApplicationController
    before_action :set_article, only: [:new, :create]
    before_action :set_forum, only: [:show]

  
  def new
    @forum = @article.forums.build
    authorize @forum 
  end

  
  def create
    @forum = @article.forums.build(forum_params)
    @forum.user = current_user 

    if @forum.save
      redirect_to forum_path(@forum), notice: 'Fórum criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def show
    @messages = @forum.messages.order(created_at: :asc) 
  end

  private

  
  def set_article
    @article = Article.find(params[:article_id])
  end

  
  def set_forum
    @forum = Forum.find(params[:id])
  end


  def forum_params
    params.require(:forum).permit(:title, :content)
  end
end
