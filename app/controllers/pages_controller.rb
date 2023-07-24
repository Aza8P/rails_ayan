class PagesController < ApplicationController
  def home 
    @train= Train.new
    @flight = Flight.new
    @hotel = Hotel.new
  end

  def about; end

  def contact; end

end
