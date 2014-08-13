class CommentsController < ApplicationController
    before_action :require_user
    authorize_resource only: :create

    def index
        if request.xhr? and params[:commentable_type] and params[:commentable_id]
            @commentable = get_commentable(params[:commentable_type], params[:commentable_id])
            render(partial: 'load_comments', locals: { commentable: @commentable }) if @commentable
        end
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.attendee = current_attendee
        @comment.save
        @commentable = get_commentable(comment_params[:commentable_type], comment_params[:commentable_id])
        @commentable.touch
        flash[:notice] = 'Comentario enviado correctamente'
        redirect_to @commentable
    end
private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
    end

    def get_commentable(commentable_type, commentable_id)
        commentable_class = commentable_type.camelize.constantize
        return commentable_class.find(commentable_id)
    end
end