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
      data["results"][long_url]
    end

    def expand(short_url)
      http_response = open(build_url("expand", "shortUrl=#{short_url}")).read
      data = JSON.parse(http_response)
      raise BitlyError.new(data["errorMessage"]) unless data["statusCode"] == "OK"
      data["results"][short_url]
    end

    def info(short_url)
      http_response = open(build_url("info", "shortUrl=#{short_url}")).read
      data = JSON.parse(http_response)
      raise BitlyError.new(data["errorMessage"]) unless data["statusCode"] == "OK"
      data["results"][short_url.split(/\//)[-1]]
    end

    def stats(short_url)
      http_response = open(build_url("stats", "shortUrl=#{short_url}")).read
      data = JSON.parse(http_response)
      raise BitlyError.new(data["errorMessage"]) unless data["statusCode"] == "OK"
      data["results"]
    end

    def errors
      http_response = open("http://api.bit.ly/errors?version=#{api_version}&login=#{login}&apiKey=#{api_key}").read
      data = JSON.parse(http_response)
      raise BitlyError.new(data["errorMessage"]) unless data["statusCode"] == "OK"
      data["results"]
    end

    private
    def build_url(api_method, api_ressource)
      "http://api.bit.ly/#{api_method}?version=#{api_version}&login=#{login}&apiKey=#{api_key}&#{api_ressource}"
    end
  end
end
