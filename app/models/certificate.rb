class Certificate < ApplicationRecord
  mount_uploader :logo_image, SectionImageUploader

  validates :title, :subtitle, :position, :alt_name, presence: true
  validates :certificate_link, presence: true, format: URI::regexp(%w[http https])
  validates :color_code, presence: true, format: { with: /\A#[A-Fa-f0-9]+\z/, message: "must be a valid hex color (e.g., #RRGGBB, #RRGGBBAA, etc.)" }

  validates :position, numericality: { only_integer: true }

  acts_as_list
  default_scope { order(position: :asc) }
end
