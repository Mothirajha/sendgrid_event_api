module SendgridEventApi

  class Connection

    attr_reader :connect

    def initialize
      @connect = Faraday.new(:url => 'https://api.sendgrid.com') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
    
  end
end