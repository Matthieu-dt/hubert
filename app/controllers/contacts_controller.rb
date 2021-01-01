class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Message bien reçu je reviens vers vous dès que possible !'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end
