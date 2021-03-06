class MessagesController < ApplicationController
  before_action :require_user
  before_action :set_wedding
  load_and_authorize_resource except: [:new, :create]
  authorize_resource only: [:new, :create]

  # GET /messages
  # GET /messages.json
  def index
    @messages = @wedding.messages.order('created_at DESC').page(params[:page])
    respond_to do |format|
      format.html {
          if request.xhr?
            render partial: 'messages', object: @messages, layout: false
          end
        }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.attendee = current_attendee

    respond_to do |format|
      if @message.save
        @message.create_activity :create, owner: @message.attendee if (current_attendee.is_groom? or current_attendee.is_bride?)
        format.html { redirect_to messages_path, notice: 'Mensaje enviado' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Mensaje actualizado' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def upvote
    @message.upvote_by current_attendee.becomes(Attendee)
    respond_to do |format|
      format.html { redirect_to @message, notice: 'Mensaje votado positivamente' }
      format.json
    end
  end

  def downvote
    @message.downvote_by current_attendee.becomes(Attendee)
    respond_to do |format|
      format.html { redirect_to @message, notice: 'Mensaje votado negativamente' }
      format.json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:message)
    end
end
