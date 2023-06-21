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
        lng: race.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { race: }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
