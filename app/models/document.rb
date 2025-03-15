class Document < ApplicationRecord
  belongs_to :project, optional: true

  mount_uploader :file, DocumentUploader
  enum status: { active: "active", inactive: "inactive" }
  enum document_type: { resume: "resume", docs: "docs" }
  validates :title, :file, :document_type, presence: true

  after_save :deactivate_other_resume, if: -> { active? && resume? }

  private

  def deactivate_other_resume
    Document.resume.active.where.not(id: id).update_all(status: "inactive")
  end
end
