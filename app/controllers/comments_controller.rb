class CommentsController < ApplicationController

  rescue_from Pundit::NotAuthorizedError do
    flash[:warning] = "You don't have access to this page"
    redirect_to events_path
  end

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.event = @event
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Created succesfully!"
      redirect_to event_path(@comment.event)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
