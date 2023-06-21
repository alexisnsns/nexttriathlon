class RacesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  # def index
  #   @races = Race.all
  # end

  def show
    @race = Race.find(params[:id])
    @user = current_user
    @comment = Comment.new

    @marker = {
      lat: @race.latitude,
      lng: @race.longitude,
      marker_html: render_to_string(partial: "marker")
    }
  end

  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)
    @race.user_id = current_user.id
    # delete the first item of array as i get an unknown "" as first item when data comes from the form
    @race.format = @race.format.drop(1)

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
    params.require(:race).permit(:title, :description, :address, :link, :date, :photo, :organizer, :swim, :bike, :run, :rating, :search,
                                 format: [])
  end
end
