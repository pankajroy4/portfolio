class Types::SkillType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :filename, String, null: false
  field :skill_highlight, [String], null: true
  field :skill_image_url, String, null: true
  field :skill_svg_data, String, null: true
  field :software_skills, [Types::SoftwareSkillType], null: true

  def skill_image_url
    object.skill_image.url
  end
end
