class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @races = if params[:search]
               Race.search(params[:search]).order('created_at DESC')
             else
               Race.all
             end
  end
end
