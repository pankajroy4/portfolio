class Queries::Skill < Queries::BaseQuery
  type Types::SkillType, null: true
  argument :id, ID, required: true

  def resolve(id:)
    Skill.includes(:software_skills).find_by(id: id)
  end
end
