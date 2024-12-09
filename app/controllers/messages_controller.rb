class MessagesController < ApplicationController
    before_action :set_forum, only: [:create]
    before_action :set_message, only: [:destroy]

    def create
        authorize @forum
      @message = @forum.messages.build(message_params)
      @message.user = current_user 
  
      if @message.save
        redirect_to forum_path(@forum), notice: 'Mensagem adicionada com sucesso.'
      else
        redirect_to forum_path(@forum), alert: 'Não foi possível adicionar a mensagem.'
      end
    end

    def destroy
        authorize @message  
        @message.destroy
        redirect_to forum_path(@message.forum), notice: 'Mensagem excluída com sucesso.'
      end
  
    private
  
    def set_message
        @message = Message.find(params[:id])
      end

    def set_forum
      @forum = Forum.find(params[:forum_id])
    end
  

    def message_params
      params.require(:message).permit(:content)
    end
end
