class Degree < ApplicationRecord
  mount_uploader :logo_image, SectionImageUploader

  validates :title, :subtitle, :alt_name, :start_date, :end_date, :description, :position, presence: true
  validates :position, numericality: { only_integer: true }
  validates :website_link, presence: true, format: URI::regexp(%w[http https])

  default_scope { order(position: :asc) }
  acts_as_list
end
