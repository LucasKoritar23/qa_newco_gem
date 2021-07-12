# frozen_string_literal: true

module QaNewcoGem
  class ApiRequest

    def initialize
      require 'httparty'
      require 'logger'
      @logger = Logger.new("evidence.log")
    end

    def execute_request(type, params)
      @logger.info("URI: #{params[:uri]}")
      @logger.info("Realizando #{type.upcase}")
      request = HTTParty.method(type.downcase).(params[:uri], params)
      @logger.info("URI Final: #{request.request.last_uri}")
      @logger.info("#{type.upcase} realizado \n")
      request
    end
  end
end
