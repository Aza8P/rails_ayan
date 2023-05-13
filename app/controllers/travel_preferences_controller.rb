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
        @travel_preference = TravelPreference.new(travel_preference_params)
        if @travel_preference.save
            redirect_to root_path, notice: 'Travel preferences saved.'
        else
            render :new
        end
        # @travel_preference = current_user.travel_preferences.build(travel_preference_params)
        # if @travel_preference.save
        #     redirect_to root_path, notice: 'Travel preferences saved.'
        # else
        #     render :new
        # end
    end

    def edit
        @travel_preference = TravelPreference.find(params[:id])
    end

    def update
        @travel_preference = TravelPreference.find(params[:id])
        if @travel_preference.update(travel_preference_params)
            redirect_to root_path, notice: 'Travel preferences updated.'
        else
            render :edit
        end
    end

    private

    def travel_preference_params
        params.require(:travel_preference).permit(:destination, :start_date, :end_date, :budget)
    end
end
