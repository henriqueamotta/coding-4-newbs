class TermsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # verifica a autenticação do admin para criar, excluir e editar terms
  after_action :verify_authorized # dupla verificação para autenticar o admin

  def index
    @terms = Term.all
  end

  def show
    @term = Term.find(params[:id])
  end

  def new
    @term = Term.new
    authorize @term
  end

  def create
    @term = Term.new(term_params)
    authorize @term
    if @term.save
      redirect_to @term, notice: 'Term was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @term
    if @term.update(term_params)
      redirect_to @term, notice: 'Term was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    authorize @term
    @term.destroy
    redirect_to terms_path, notice: 'Term was successfully deleted!'
  end

  private

  def term_params
    params.require(:term).permit(:name, :description)
  end
end
