class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new(key: params[:key])
  end

  def create
    @document = Document.new(document_params)
    @document.remote_attachment_url = @document.attachment.direct_fog_url+@document.key
    if @document.save!
      #Resque.enqueue(AttachmentProcessor, @document.id, @document.key)
      redirect_to @document, notice: 'User was successfully created. Waiting for Avatar to be processed. Refresh at will'
    else
      render action: "new"
    end
  end
  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def document_params
    params.require(:document).permit(:name,:key)
  end
end
