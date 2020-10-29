# frozen_string_literal: true

# Contact Controller, allows people to contact Club through the website
class ContactController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    # Prevent sending mail if ham_sandwich "honey pot" bot field completed
    if @contact.ham_sandwich.present?
      redirect_to root_url
    elsif @contact.deliver
      redirect_to root_url
      flash[:success] = 'Thank you for your message! We will get back to you soon'
    else
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
