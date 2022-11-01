class MoviesSearchController < ApplicationController
  def index
    @search = Movie.joins(:movie_detail,:movie_songs).ransack(params[:q])
    @results = @search.result.group(:id,:producer,:total_income,:released_year,:stock)
    @results = Kaminari.paginate_array(@results).page(params[:page]).per(15)
  end
end