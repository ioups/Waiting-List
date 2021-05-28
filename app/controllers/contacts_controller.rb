class ContactsController < ApplicationController
    def index
        @prospects = Contact.where("email_confirmation = true")
        @contacts = Contact.where("email_confirmation = false")
    end
    
    
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(params[contact_params])
        if @contact.save
          flash[:success] = "contact successfully created"
          redirect_to @contact
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def edit
        @contact = Contact.find(params[:id])
    end

    def update
        @contact = Contact.find(params[:id])
        if @contact.update(contact_params)
          flash[:success] = "contact was successfully updated"
          redirect_to @contact
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    

    def destroy
        @contact = Contact.find(params[:id])
        if @contact.destroy
            flash[:success] = 'contact was successfully deleted.'
            redirect_to contacts_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to contacts_url
        end
    end
    
    private
    
    def contact_params
        params.require(:contact).permit(:firstname, :lastname, :email, :phone_number) 
    end
    
end
