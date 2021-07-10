
# frozen_string_literal: true

module QaNewcoGem
    class LogService
  
      def initialize
        require 'logger'
        @logger = Logger.new("evidence.log")
      end

      def log_file(message, log = nil)
        @logger.info(message) unless log.nil?
      end
    end
end
