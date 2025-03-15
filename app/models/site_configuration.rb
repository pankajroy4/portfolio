class SiteConfiguration < ApplicationRecord
  enum status: { active: "active", inactive: "inactive" }
  belongs_to :theme, optional: true
  after_save :deactivate_other_records, if: -> { active? } 

  private

  def deactivate_other_records
    SiteConfiguration.where.not(id: id).update_all(status: :inactive)
  end
end
