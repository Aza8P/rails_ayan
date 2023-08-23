class FlightsController < ApplicationController

 before_action :set_flight, only: [:show, :edit, :update, :destroy]

 def new
  @flight = Flight.new
 end

 def create
  @flight = current_user.flights.new(flight_params)
 end

 private

 def flight_params
  params.require(:flight).permit(:start_date, :end_date, :destination, :origin, :two_way)
 end

 def set_flight
  @flight = Flight.find(params[:id])
 end
end
