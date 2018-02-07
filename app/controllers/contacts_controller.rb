class ContactsController <ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    if @contact.save
      flash[:success] = "Contact added!"
      redirect_to company_path(@contact.company)
    else
      flash[:error] = "Contact not saved. Try again."
      redirect_to company_path(@contact.company)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end

end
