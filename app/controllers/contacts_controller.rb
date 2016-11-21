require 'pry'

class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    # binding.pry
    
    ## for images
    contact_params[:files].each do |file|
      Cloudinary::Uploader.upload(file)
    end

    ## for image
    Cloudinary::Uploader.upload(contact_params[:file])

    ## for video
    Cloudinary::Uploader.upload(contact_params[:file_video], :resource_type => :video)

  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:file, :file_video, {files: []})
    end

end
