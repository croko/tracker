class CommentsController < ApplicationController
  before_action :set_comment, only: [:create]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Task.find(params[:task_id]).comments.includes(:user).references(:user)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Task.find(params[:task_id]).comments.new(comment_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
