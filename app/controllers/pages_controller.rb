class PagesController < ApplicationController
  def home
    @pagy, @rooms = pagy(Room.all, items: 6)
    @search = @rooms.ransack(params[:q])
    @reviews = Review.all

    respond_to do |format|
      format.html
      format.json {
        render json: {
          entries: render_to_string(partial: @rooms, formats: [:html]), pagination: view_context.pagy_nav(@pagy)
        }
      }
    end
  end

  def search 
    # if params[:search].present? && params[:search].strip != ""
    #   session[:loc_search] = params[:search]
    # end

    # arrResult = Array.new 

    # if session[:loc_search] && session[:loc_search] != ""
    #   @rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
    # else
    #   @rooms_address = Room.where(active: true).all
    # end

    @search = Room.all.ransack(params[:q])
    @search_result = @search.result

    @room_result_arr = @room_result.to_a

    # if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty? )
  
    #   start_date = Date.parse(params[:start_date])
    #   end_date = Date.parse(params[:end_date])
    #   @room_result.each do |room_result|
    #     not_available = room_result.reservations.where(
    #       "(? <= start_date AND start_date <= ?)
    #       OR (? <= end_date AND end_date <= ?)
    #       OR (start_date < ? AND ? < end_date)",
    #       start_date, end_date,
    #       start_date, end_date,
    #       start_date, end_date
    #     ).limit(1)

    #     if not_available.length > 0 
    #       @room_result_arr.delete(room_result)
    #     end
    #   end

    # end

  end
end
