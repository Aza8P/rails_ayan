class TrainsController < ApplicationController
    include Rails.application.routes.url_helpers
    before_action :set_train, only: [:show, :edit, :update, :destroy]

    def new
        @train = Train.new
        # @train.travel_type = "train"
    end

    def create   
        locale = params[:locale] || :en
        I18n.locale = locale
        @train = current_user.trains.new(train_params)

        puts "@train.origin: #{@train.origin}"
        puts "@train.destination: #{@train.destination}"
        # puts "travel type: #{@train.travel_type}"
        

        respond_to do |format|
            if @train.save
                format.html { redirect_to root_path, notice: "it was successfully created." }
            else
                # format.html { render :new, status: :422 }
                format.json { render json: @train.errors, status: :unprocessable_entity }
            end
        end

    end
    private

    def train_params
        params.require(:train).permit(:origin, :destination, :start_date, :end_date, :travel_type, :two_way)
    end

    def set_train
        @train = Train.find(params[:id])
    end

    def trip_api_request(train)
        alliance_id = '12345'
        sid = '987654'
        user_key = 'af85s54f66s4fd5s64f112sf25'
        icode = '95fs2sf123s1f23s1f56s4f1s3f'
        uuid = SecureRandom.uuid
    
        url = "http://openservice.ctrip.com/openservice/serviceproxy.ashx?e=r6&aid=#{alliance_id}&sid=#{sid}&token=#{user_key}&icode=#{icode}&uuid=#{uuid}"
    
        request_body = {
          destination: train.destination,
          start_date: train.start_date,
          end_date: train.end_date,
          budget: train.budget
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
