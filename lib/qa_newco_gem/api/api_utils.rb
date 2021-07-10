
# frozen_string_literal: true

module QaNewcoGem
    class ApiUtils
  
      def initialize
        require 'logger'
        require 'httparty'
        @logger = Logger.new("evidence.log")
      end

      def request_parse(request)
        begin
            @logger.info("Realizando o parse da request")
            request.parsed_response
            @logger.info("Parse realizado com sucesso")
            @logger.info("Response: #{JSON.pretty_generate(request.parsed_response)}")
            return request.parsed_response
        rescue => exception
            @logger.error("Falha ao retornar a requisição parseada")
            @logger.error("Request: #{request}")
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
        rescue RSpec::Expectations::ExpectationNotMetError => e
            @logger.error("Falha na comparação de status code")
            @logger.error("Response de erro: #{request_parse(request)}")
            raise e
        rescue => exception
            @logger.error("Falha na comparação de status code")
            raise exception
        end
      end
    end
end
