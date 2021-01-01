class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(params[:contact])
    authorize @contact
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to categories_path, notice: 'Message sent successfully'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end

end
