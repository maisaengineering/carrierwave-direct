class Document < ActiveRecord::Base
  #attr_accessible :name
  mount_uploader :attachment, AttachmentUploader
end
