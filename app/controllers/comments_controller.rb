class CommentsController < ApplicationController
  before_action :find_comment, only: %i[show edit update destroy]
  before_action :find_race, only: %i[show create edit update destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.race_id = @race.id
    @comment.positive = @comment.positive.capitalize
    @comment.negative = @comment.negative.capitalize
    @comment.body = @comment.body.capitalize

    if @comment.save
      redirect_to race_path(@race)
    else
      render 'races/show', status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @comment.destroy
    redirect_to race_path(@race), status: :see_other
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @race
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:date, :body, :positive, :negative, :rating)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_race
    @race = Race.find(params[:race_id])
  end
end
