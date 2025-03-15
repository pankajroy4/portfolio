class BgImage < ApplicationRecord
  mount_uploader :bg_image, ProjectBgimageUploader
  belongs_to :project
end