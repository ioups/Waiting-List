class ContactsController < ApplicationController
    def index
        @prospects = Contact.where("email_confirmation = true")
        @contacts = Contact.where("email_confirmation = false")
    end
    
    
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
          ContactMailer.welcome(@contact).deliver_now
          flash[:success] = "contact successfully created"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def confirm_email
        @contact = Contact.find_by_confirm_token(params[:id])
        if @contact
            @contact.confirmed!
            @contact.validated_on!
            flash[:success] = "Added on the wait list !"
            redirect_to root_path
        else
            flash[:error] = "something went wrong"
            redirect_to root_path
        end
    end
    
    
    def edit
        find_contact
    end

    def update
        find_contact
        if @contact.update(contact_params)
          flash[:success] = "contact was successfully updated"
          redirect_to @contact
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    

    def destroy
        find_contact
        if @contact.destroy
            flash[:success] = 'contact was successfully deleted.'
            redirect_to contacts_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to contacts_url
        end
    end
    
    private

    def find_contact
        @contact = Contact.find(params[:id])
    end

    def contact_params
        params.require(:contact).permit(:firstname, :lastname, :email, :phone_number) 
    end
    
end
