module SendgridEventApi

  class Bounce
    # https://sendgrid.com/docs/API_Reference/Web_API/bounces.html
    # https://api.sendgrid.com/api/bounces.get.json?api_user=email@domain.com&api_key=XXXXXXXX
    
    def initialize(username, password)
      @@api_key = password
      @@api_user = username
      @@conn = Faraday.new(:url => 'https://api.sendgrid.com') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def emails(args={})
      @@conn.params = {api_user: @@api_user, api_key: @@api_key}.merge!(args)
      @@conn.get '/api/bounces.get.json'
    end 
  end
end