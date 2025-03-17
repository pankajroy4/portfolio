class Section < ApplicationRecord
  mount_uploader :section_image, SectionImageUploader

  before_save :sanitize_svg_data

  validates :section_name, :title, presence: true
  private

  def sanitize_svg_data
    self.section_svg_data = section_svg_data.strip if section_svg_data.present?
  end
end