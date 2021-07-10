# frozen_string_literal: true

require_relative "qa_newco_gem/version"
require_relative "qa_newco_gem/api/api_request"
require_relative "qa_newco_gem/api/api_utils"
require_relative "qa_newco_gem/helpers/helper_faker"

include RSpec::Matchers #config para permitir expect dentro de métodos

module QaNewcoGem
  class Error < StandardError; end
  
  require 'logger'
  LOGGER = Logger.new("evidence.log")
end
