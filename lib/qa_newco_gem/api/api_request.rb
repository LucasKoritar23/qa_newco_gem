# frozen_string_literal: true

module QaNewcoGem
  class ApiRequest

    def initialize
      require 'httparty'
      require 'logger'
      @logger = Logger.new("evidence.log")
    end

    def validate_types(type)
      types = %w[post get patch delete put]
      unless types.include? type.downcase
        raise ArgumentError.new("Tipo informado incorreto")
      end

      type.downcase
    end

    def execute_request(type, params)
      type = validate_types(type)
      @logger.info("URI: #{params[:uri]}")
      @logger.info("Realizando #{type.upcase}")
      request = HTTParty.method(type).(params[:uri], params)
      @logger.info("URI Final: #{request.request.last_uri}")
      @logger.info("#{type.upcase} realizado \n")
      request
    end
  end
end
