class TravelPreferencesController < ApplicationController
    # def index
    #     @travel_preferences = TravelPreference.all
    # end

    # def show
    #     @travel_preference = TravelPreference.find(params[:id])
    # end

    def new
        @travel_preference = TravelPreference.new
    end

    def create
        @travel_preference = current_user.travel_preferences.build(travel_preference_params)
        if @travel_preference.save
            redirect_to @travel_preference
        else
            render error
        end
    end

    private

    def travel_preference_params
        params.require(:travel_preference).permit(:destination, :start_date, :end_date, :budget)
    end
end
