class PagesController < ApplicationController
  def home 
    @train= Train.new
  end

  def about; end

  def contact; end

end
