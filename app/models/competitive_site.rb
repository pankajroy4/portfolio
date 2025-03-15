class CompetitiveSite < ApplicationRecord
  validates :site_name, presence: true
  validates :iconify_classname, presence: true, uniqueness: true
  validates :profile_link, presence: true, uniqueness: true
  before_save :validate_json_format

  acts_as_list

  private

  def validate_json_format
    JSON.parse(style.to_json)
  rescue JSON::ParserError
    errors.add(:style, "must be a valid JSON format")
  end
end
