
# frozen_string_literal: true

module QaNewcoGem
    class RedisService
  
      def initialize
        require 'redis'
        require 'logger'
        @logger = Logger.new("evidence.log")
      end

      def redis_connection(uri, port = nil)
        port = 6379 if port.nil?
        redis_params = { host: uri, port: port, connect_timeout: 0.5, read_timeout: 1.0, write_timeout: 1.0 }
        redis = Redis.new(redis_params)
        begin
          redis.ping
          redis
        rescue => exception
          redis = nil
          @logger.error("Params Redis: #{JSON.pretty_generate(JSON.parse(redis_params.to_json))}")
          @logger.error("Exceção retornada do Redis: #{e.inspect} - Mensagem: #{e.message}")
        end
  
        redis
      end

      def check_connection(redis)
        if redis.nil?
          @logger.error("Conexão incorreta com o Redis")
          return false
        end
      end
  
      def get_key_redis(redis, key)
        return if check_connection(redis) == false
        @logger.info("Buscando chave #{key} no Redis")
        begin
          redis.get(key)
        rescue => exception
          @logger.error("Exceção retornada do redis ao consultar a chave: #{e}")
          nil
        end
      end
  
      def set_key_redis(redis, key, value, ttl)
        return if check_connection(redis) == false
        @logger.info("Cadastrando chave #{key} com valor: #{value} e tempo de duração: #{ttl}")
        begin
          set_redis = redis.set(key, value, ex: ttl)
          @logger.info('Chave cadastrada com sucesso no redis') if set_redis == 'OK'
        rescue => exception
          @logger.error("Exceção retornada do redis ao cadastrar a chave: #{e}")
          nil
        end
      end
    end
end
