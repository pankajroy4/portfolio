class Queries::Skills < Queries::BaseQuery
  type [Types::SkillType], null: false

  def resolve
    Skill.includes(:software_skills).order(:position)
  end  
end
