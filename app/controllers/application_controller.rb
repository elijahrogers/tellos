class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @city = request.location.city.presence || 'Reno, NV'
    # lat_lon = Geocoder.search(@city)[0].coordinates
    client = YahooWeather::Client.new
    @weather = client.fetch(2480201)
  end

  private

  def require_login
    unless current_user
      redirect_to unauthenticated_root_path
    end
  end
end
