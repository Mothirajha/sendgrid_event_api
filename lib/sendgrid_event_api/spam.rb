module SendgridEventApi

  class Spam

    attr_reader :api_key, :api_user, :conn

    def initialize(username, password)
      @api_key = password
      @api_user = username
      @conn = SendgridEventApi::Connection.new.connect
    end

    def list(args={})
      conn.get '/api/spamreports.get.json', merge_params(api_user, api_key, args)
    end

    def delete(args={})
      conn.post '/api/spamreports.delete.json', merge_params(api_user, api_key, args)
    end

    def count(args={})
      conn.get '/api/spamreports.count.json', merge_params(api_user, api_key, args)
    end

    private

    def merge_params(api_user, api_key, args)
      {api_user: api_user, api_key: api_key}.merge!(args)
    end

  end
end