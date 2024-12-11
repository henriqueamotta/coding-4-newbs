class SearchController < ApplicationController

  def index
    @terms = policy_scope(Term)
    if params[:query].present?
      @terms = @terms.where("name ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    @articles = policy_scope(Article)
    if params[:query].present?
      @articles = @articles.where("name ILIKE ? OR content ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end

end
