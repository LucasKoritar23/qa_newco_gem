
# frozen_string_literal: true

module QaNewcoGem
    class ApiRequest
  
      def initialize
        require 'httparty'
        require 'logger'
        @logger = Logger.new("evidence.log")
      end

      def execute_post(params)
        @logger.info("URI: #{params[:uri]}")
        @logger.info('Realizando POST')
        request = HTTParty.post(params[:uri], params)
        @logger.info("URI Final: #{request.request.last_uri}")
        @logger.info("POST realizado \n")
        request
      end
  
      def execute_get(params)
        @logger.info("URI: #{params[:uri]}")
        @logger.info('Realizando GET')
        request = HTTParty.get(params[:uri], params)
        @logger.info("URI Final: #{request.request.last_uri}")
        @logger.info("GET realizado \n")
        request
      end
  
      def execute_patch(params)
        @logger.info("URI: #{params[:uri]}")
        @logger.info('Realizando PATCH')
        request = HTTParty.patch(params[:uri], params)
        @logger.info("URI Final: #{request.request.last_uri}")
        @logger.info("PATCH realizado \n")
        request
      end
  
      def execute_put(params)
        @logger.info("URI: #{params[:uri]}")
        @logger.info('Realizando PUT')
        request = HTTParty.put(params[:uri], params)
        @logger.info("URI Final: #{request.request.last_uri}")
        @logger.info("PUT realizado \n")
        request
      end
  
      def execute_delete(params)
        @logger.info("URI: #{params[:uri]}")
        @logger.info('Realizando DELETE')
        request = HTTParty.put(params[:uri], params)
        @logger.info("URI Final: #{request.request.last_uri}")
        @logger.info("DELETE realizado \n")
        request
      end
    end
  end