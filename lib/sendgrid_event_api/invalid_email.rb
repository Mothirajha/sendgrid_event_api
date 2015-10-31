module SendgridEventApi

  class InvalidEmail

    attr_reader :api_key, :api_user, :conn

    def initialize(username, password)
      @api_key = password
      @api_user = username
      @conn = SendgridEventApi::Connection.new.connect
    end

    def list(args={})
      conn.get '/api/invalidemails.get.json', merge_params(api_user, api_key, args)
    end

    def delete
      conn.post '/api/invalidemails.delete.json', merge_params(api_user, api_key, args)
    end

    def count
      conn.get '/api/invalidemails.count.json', merge_params(api_user, api_key, args)
    end

    private

    def merge_params(api_user, api_key, args)
      {api_user: api_user, api_key: api_key}.merge!(args)
    end

  end
end