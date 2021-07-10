
# frozen_string_literal: true

module QaNewcoGem
    class ApiRequest
  
      def initialize
        require 'httparty'
      end

      def execute_post(params)
        LOGGER.info("URI: #{params[:uri]}")
        LOGGER.info('Realizando POST')
        request = HTTParty.post(params[:uri], params)
        LOGGER.info("URI Final: #{request.request.last_uri}")
        LOGGER.info("POST realizado \n")
        request
      end
  
      def execute_get(params)
        LOGGER.info("URI: #{params[:uri]}")
        LOGGER.info('Realizando GET')
        request = HTTParty.get(params[:uri], params)
        LOGGER.info("URI Final: #{request.request.last_uri}")
        LOGGER.info("GET realizado \n")
        request
      end
  
      def execute_patch(params)
        LOGGER.info("URI: #{params[:uri]}")
        LOGGER.info('Realizando PATCH')
        request = HTTParty.patch(params[:uri], params)
        LOGGER.info("URI Final: #{request.request.last_uri}")
        LOGGER.info("PATCH realizado \n")
        request
      end
  
      def execute_put(params)
        LOGGER.info("URI: #{params[:uri]}")
        LOGGER.info('Realizando PUT')
        request = HTTParty.put(params[:uri], params)
        LOGGER.info("URI Final: #{request.request.last_uri}")
        LOGGER.info("PUT realizado \n")
        request
      end
  
      def execute_delete(params)
        LOGGER.info("URI: #{params[:uri]}")
        LOGGER.info('Realizando DELETE')
        request = HTTParty.put(params[:uri], params)
        LOGGER.info("URI Final: #{request.request.last_uri}")
        LOGGER.info("DELETE realizado \n")
        request
      end
    end
  end