class Mutations::CreateSkill < Mutations::BaseMutation
  argument :title, String, required: true
  argument :filename, String, required: true
  argument :skill_highlight, [String], required: false
  argument :skill_image, String, required: false

  type Types::SkillType

  def resolve(title:, filename:, skill_highlight: [], skill_image: nil)
    Skill.create!(
      title: title,
      filename: filename,
      skill_highlight: skill_highlight,
      skill_image: skill_image,
    )
  end
end
