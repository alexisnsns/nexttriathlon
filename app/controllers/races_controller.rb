class RacesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_race, only: %i[show edit update destroy]

  def index
    @races = if params[:search]
               Race.search(params[:search]).order('created_at DESC')
             else
               Race.all.geocoded
             end

    @markers = @races.geocoded.map do |race|
      {
        lat: race.latitude,
        lng: race.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { race: }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @user = current_user
    @comment = Comment.new

    @marker = {
      lat: @race.latitude,
      lng: @race.longitude,
      marker_html: render_to_string(partial: "marker")
    }
    authorize @race
  end

  def new
    @race = Race.new
    authorize @race
  end

  def create
    @race = Race.new(race_params)
    @race.user_id = current_user.id
    # delete the first item of array as i get an unknown "" as first item when data comes from the form

    if @race.save
      redirect_to @race
    else
      render :new, status: :unprocessable_entity
    end
    authorize @race
  end

  def edit
    authorize @race
  end

  def update
    if @race.update(race_params)

      redirect_to @race
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @race
  end

  def destroy
    @race.destroy
    redirect_to root_path, status: :see_other
    authorize @race
  end

  private

  def race_params
    params.require(:race).permit(:title, :description, :address, :link, :date, :photo, :organizer, :swim, :bike, :run, :rating, :search,
                                 format: [])
  end

  def find_race
    @race = Race.find(params[:id])
  end
end
