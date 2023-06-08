require 'net/http'
require 'json'

class TravelPreferencesController < ApplicationController
    def new
        @travel_preference = TravelPreference.new
    end

    def create
        @travel_preference = TravelPreference.new(travel_preference_params)
        # @travel_preference.user_id = current_user.id

        if @travel_preference.save
            # make the API request to Trip.com
            response = trip_api_request(@travel_preference)
            if response.code == 200
            # process the API response and extract the relevant data
            @data = process_api_response(response)

            # render the agenda page with the fetched data
            render json: { data: @data}
            else
             # Handle API request error
             # Display an error message or perform appropriate error handling
            end
        else
            # Handle saving the travel preference error
            # Display an error message or perform appropriate error handling 
        end
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

    def destroy
        @travel_preference.destroy
    end

    private

    def travel_preference_params
        params.require(:travel_preference).permit(:destination, :start_date, :end_date, :budget)
    end

    def trip_api_request(travel_preference)
        alliance_id = '12345'
        sid = '987654'
        user_key = 'af85s54f66s4fd5s64f112sf25'
        icode = '95fs2sf123s1f23s1f56s4f1s3f'
        uuid = SecureRandom.uuid
    
        url = "http://openservice.ctrip.com/openservice/serviceproxy.ashx?e=r6&aid=#{alliance_id}&sid=#{sid}&token=#{user_key}&icode=#{icode}&uuid=#{uuid}"
    
        request_body = {
          destination: travel_preference.destination,
          start_date: travel_preference.start_date,
          end_date: travel_preference.end_date,
          budget: travel_preference.budget
        }
    
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.path)
        request['Content-Type'] = 'application/json'
        request.body = request_body.to_json
    
        return http.request(request)
    
    end
    
    def process_api_response(response)
      JSON.parse(response.body)
    end
end
