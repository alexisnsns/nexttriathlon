class PagesController < ApplicationController

  def home
    @races = if params[:search]
               Race.search(params[:search]).order('created_at DESC')
             else
               Race.all.geocoded
             end

    @markers = @races.geocoded.map do |race|
      {
        lat: race.latitude,
        lng: race.longitude
      }
    end
  end
end
