class Mutations::CreateSoftwareSkill < Mutations::BaseMutation
  argument :skill_id, ID, required: true
  argument :skill_name, String, required: true
  argument :font_aws_icon_class, String, required: true
  argument :style, GraphQL::Types::JSON, required: false

  type Types::SoftwareSkillType

  def resolve(skill_id:, skill_name:, font_aws_icon_class:, style: {})
    SoftwareSkill.create!(
      skill_id: skill_id,
      skill_name: skill_name,
      font_aws_icon_class: font_aws_icon_class,
      style: style,
    )
  end
end
