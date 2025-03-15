module Types
  class StatusEnum < Types::BaseEnum
    value "active", "Active status for the record", value: "active"
    value "inactive", "Inactive status for the record", value: "inactive"
  end
end
