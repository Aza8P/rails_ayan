require 'net/http'
require 'json'

class TravelPreferencesController < ApplicationController
     before_action :set_travel_preference, only: [:show, :edit, :update, :destroy]

    def new
        @travel_preference = TravelPreference.new
    end

    def create
        @travel_preference = TravelPreference.new(travel_preference_params)
        @travel_preference.user = current_user
        
        if @travel_preference.save
            # send email to the admin with the request 
        else
            render :agenda
        end

        #after obtaining the api key from Trip.com, uncomment the following code & add the api key to the request
        # if @travel_preference.save
        #     # make the API request to Trip.com
        #     response = trip_api_request(@travel_preference)
        #     if response.code == 200
        #     # process the API response and extract the relevant data
        #     @data = process_api_response(response)

        #     # render the agenda page with the fetched data
        #     render json: { data: @data}
        #     else
        #      # Handle API request error
        #      # Display an error message or perform appropriate error handling
        #     end
        # else
        #     # Handle saving the travel preference error
        #     # Display an error message or perform appropriate error handling 
        # end
    end

    private

    def travel_preference_params
        params.require(:travel_preference).permit(:destination, :start_date, :end_date, :origin, :budget, :one_way)
    end

    def set_travel_preference
        @travel_preference = TravelPreference.find(params[:id])
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
