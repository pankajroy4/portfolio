class Queries::Experiences < Queries::BaseQuery
  type [Types::GroupedExperienceType], null: false

  def resolve
    experiences = Experience.order(:position)
    
    experiences.group_by(&:experience_type).map do |type, experiences|
      { experience_type: type, experiences: experiences }
    end
  end  
end
