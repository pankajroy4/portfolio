module Types
  class DateType < Types::BaseScalar
    description "input date format would be dd-mm-yyyy or dd/mm/yyyy"

    def self.coerce_input(input_value, _context)
      # Override this to prepare a client-provided GraphQL value for your Ruby code
      return nil if input_value.blank?

      Date.parse(input_value)
    end

    def self.coerce_result(date_obj, _context)
      # Override this to serialize a Ruby value for the GraphQL response
      date_obj.is_a?(Date) || date_obj.is_a?(ActiveSupport::TimeWithZone) ? date_obj.strftime("%d/%m/%Y") : nil
    end
  end
end
