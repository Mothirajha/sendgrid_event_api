# https://sendgrid.com/docs/API_Reference/Web_API/bounces.html
# https://api.sendgrid.com/api/bounces.get.json?api_user=email@domain.com&api_key=XXXXXXXX

module SendgridEventApi

  class Bounce
    
    attr_reader :api_key, :api_user, :conn

    def initialize(username, password)
      @api_key = password
      @api_user = username
      @conn = SendgridEventApi::Connection.new.connect
    end

    def list(args={})
      conn.get '/api/bounces.get.json', merge_params(api_user, api_key, args)
    end

    def delete(args={})
      conn.post '/api/bounces.delete.json', merge_params(api_user, api_key, args)
    end

    def count(args)
      conn.get '/api/bounces.count.json', merge_params(api_user, api_key, args)
    end

    private

    def merge_params(api_user, api_key, args)
      {api_user: api_user, api_key: api_key}.merge!(args)
    end
  end
end
