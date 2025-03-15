class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  mount_uploader :profile_image, DocumentUploader
  enum role: { admin: "admin", viewer: "viewer" }
  before_validation :set_uid, on: :create
  validates :name, :role, :email, presence: true

  private

  def set_uid
    self.uid = email if uid.blank?
  end
end
