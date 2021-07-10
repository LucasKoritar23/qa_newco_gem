
# frozen_string_literal: true

module QaNewcoGem
    class ApiUtils
  
      def initialize
        require 'httparty'
      end

      def request_parse(request)
        begin
            @logger.info("Parseando a requisição")
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
            @logger.info("status code Esperado no Gherkin: #{status_code}")
            @logger.info("status code Recebido da API: #{request.code}")
            expect(request.code).to eq(status_code)
        rescue RSpec::Expectations::ExpectationNotMetError => e
            @logger.error("Codes divergentes")
            raise e
        rescue => exception
            @logger.error("Falha genérica na comparação de status code")
            raise exception
        end
      end
    end
end
