class TravelPreferencesController < ApplicationController
    include Rails.application.routes.url_helpers
    before_action :set_travel_preference, only: [:show, :edit, :update, :destroy]

    def new
        @travel_preference = TravelPreference.new
        @travel_preference.travel_type = "train" #default value
    end

    def create   
        locale = params[:locale] || :en
        I18n.locale = locale
        @travel_preference = current_user.travel_preferences.new(travel_preference_params)

        puts "@travel_preference.origin: #{@travel_preference.origin}"
        puts "@travel_preference.destination: #{@travel_preference.destination}"
        puts "travel type: #{@travel_preference.travel_type}"
        

        respond_to do |format|
            if @travel_preference.save
                format.html { redirect_to root_path, notice: "it was successfully created." }
            else
                # format.html { render :new, status: :422 }
                format.json { render json: @travel_preference.errors, status: :unprocessable_entity }
            end
        end

    end
    private

    def travel_preference_params
        params.require(:travel_preference).permit(:origin, :destination, :start_date, :end_date, :travel_type, :two_way)
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
