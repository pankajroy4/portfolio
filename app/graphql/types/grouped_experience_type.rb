class Types::GroupedExperienceType < Types::BaseObject
  field :experience_type, String, null: false
  field :experiences, [Types::ExperienceType], null: false
end
