class RacesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  # def index
  #   @races = Race.all
  # end

  def show
    @race = Race.find(params[:id])
    @user = current_user
    @comment = Comment.new
  end

  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)
    @race.user_id = current_user.id
    @race.picture.attach(params[:race][:picture])
    if @race.save
      redirect_to @race
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @race = Race.find(params[:id])
  end

  def update
    @race = Race.find(params[:id])
    if @race.update(race_params)
      redirect_to @race
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @race = Race.find(params[:id])
    @race.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def race_params
    params.require(:race).permit(:title, :description, :link, :date, :picture, :organizer, :swim, :bike, :run, :rating, :search,
                                 format: [])
  end
end
