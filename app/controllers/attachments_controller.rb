class AttachmentsController < ApplicationController
  def new
    @uploader = Document.new.attachment
    @uploader.success_action_redirect = new_document_url
  end
end
