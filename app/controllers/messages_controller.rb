class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def mysent
    @messages = current_user.sent_messages
  end

  def myreceived
    @messages = current_user.received_messages
  end

  def show
    @message = Message.find(params[:id])
  end

  def showsent
    @message = Message.find(params[:id])
  end

  def showreceived
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new
    @message.recipient_id = params[:recipient_id]
    @message.sender_id = params[:sender_id]
    @message.message_text = params[:message_text]

    if @message.save
      redirect_to "/messages", :notice => "Message created successfully."
    else
      render 'new'
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    @message.recipient_id = params[:recipient_id]
    @message.sender_id = params[:sender_id]
    @message.message_text = params[:message_text]

    if @message.save
      redirect_to "/messages", :notice => "Message updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @message = Message.find(params[:id])

    @message.destroy

    redirect_to "/messages", :notice => "Message deleted."
  end
end
