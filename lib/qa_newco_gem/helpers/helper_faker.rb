
# frozen_string_literal: true

module QaNewcoGem
    class HelperFaker
  
      def initialize
        require 'logger'
        require 'faker'
        @logger = Logger.new("evidence.log")
        @logger.formatter = proc { |severity, datetime, progname, msg|
          "[QA_NEWCO_GEM][#{severity}][#{Time.now.strftime("%Y-%m-%d %H:%M:%S.%L")}]: #{msg.dump}\n"
        }
      end

      def first_name(gender = nil)
        genders = %w[m f]
        gender = genders.sample if gender.nil?
        name = Faker::Name.male_first_name if gender == "m"
        name = Faker::Name.female_first_name if gender == "f"
  
        name
      end
  
      def last_name
        Faker::Name.last_name
      end
  
      def complete_name
        "#{first_name} #{last_name}"
      end

    end
end
