class PagesController < ApplicationController
  def home; end

  def about; end

  def contact; end

  def agenda
    @travel_preference = TravelPreference.new
  end
end
