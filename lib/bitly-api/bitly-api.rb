module BitlyApi
  class BitlyError < StandardError
  end

  class Bitly
    attr_accessor :login
    attr_accessor :api_key
    attr_accessor :api_version 

    def initialize(options = {})
      raise ArgumentError.new(":login and :api_key are required") if (options[:login].nil? or options[:api_key].nil?)
      options[:version] = "2.0.1" if options[:version].nil?

      self.login = options[:login]
      self.api_key = options[:api_key]
      self.api_version = options[:version]
    end

    def shorten(long_url)
      http_response = open(build_url("shorten", "longUrl=#{long_url}")).read
      data = JSON.parse(http_response)
      raise BitlyError.new(data["errorMessage"]) unless data["statusCode"] == "OK"
      results = data["results"][long_url]
      results
    end

    def expand(short_url)
      http_response = open(build_url("expand", "shortUrl=#{short_url}")).read
      data = JSON.parse(http_response)
      raise BitlyError.new(data["errorMessage"]) unless data["statusCode"] == "OK"
      results = data["results"][short_url]
      results
    end

    private
    def build_url(api_method, api_ressource)
      "http://api.bit.ly/#{api_method}?version=#{api_version}&login=#{login}&apiKey=#{api_key}&#{api_ressource}"
    end
  end
end
