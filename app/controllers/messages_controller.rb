class MessagesController < ApplicationController
    before_action :set_forum

    def create
      @message = @forum.messages.build(message_params)
      @message.user = current_user 
  
      if @message.save
        redirect_to forum_path(@forum), notice: 'Mensagem adicionada com sucesso.'
      else
        redirect_to forum_path(@forum), alert: 'Não foi possível adicionar a mensagem.'
      end
    end
  
    private
  
   
    def set_forum
      @forum = Forum.find(params[:forum_id])
    end
  

    def message_params
      params.require(:message).permit(:content)
    end
end
