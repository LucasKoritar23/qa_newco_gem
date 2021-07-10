
# frozen_string_literal: true

module QaNewcoGem
    class ApiUtils
  
      def initialize
        require 'httparty'
      end

      def request_parse(request)
        begin
            LOGGER.info("Parseando a requisição")
            request.parsed_response
            LOGGER.info("Parse realizado com sucesso")
            LOGGER.info("Response: #{JSON.pretty_generate(request.parsed_response)}")
            return request.parsed_response
        rescue => exception
            LOGGER.error("Falha ao retornar a requisição parseada")
            LOGGER.error("Request: #{request}")
            raise exception
        end
      end

      def verify_status_code(request, status_code)
        require 'rspec'
        begin
            LOGGER.info("Verificando status_code da requisição")
            LOGGER.info("status code Esperado no Gherkin: #{status_code}")
            LOGGER.info("status code Recebido da API: #{request.code}")
            expect(request.code).to eq(status_code)
        rescue RSpec::Expectations::ExpectationNotMetError => e
            LOGGER.error("Codes divergentes")
            raise e
        rescue => exception
            LOGGER.error("Falha genérica na comparação de status code")
            raise exception
        end
      end
    end
end
