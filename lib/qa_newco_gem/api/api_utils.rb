
# frozen_string_literal: true

module QaNewcoGem
    class ApiUtils
  
      def initialize
        require 'logger'
        require 'httparty'
        @logger = Logger.new($stdout)
      end

      def request_parse(request)
        begin
            @logger.info("Realizando o parse da request")
            request.parsed_response
            @logger.info("Parse realizado com sucesso")
            return request.parsed_response
        rescue => exception
            @logger.info("Falha ao retornar a requisição parseada")
            @logger.info("Request: #{request}")
            raise exception
        end
      end

      def verify_status_code(request, status_code)
        require 'rspec'
        begin
            @logger.info("Verificando status_code da requisição")
            @logger.info("status code Esperado: #{status_code}")
            @logger.info("status code Recebido: #{request.code}")
            expect(request.code).to eq(status_code)
        rescue => exception
            @logger.info("Falha na comparação de status code")
            @logger.info("Request: #{request_parse(request)}")
            raise exception
        end
      end
    end
end
