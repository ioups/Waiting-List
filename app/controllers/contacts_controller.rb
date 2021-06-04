class ContactsController < ApplicationController
    def index
        @prospects = Contact.where("email_confirmation = true")
        @contacts = Contact.where("email_confirmation = false")
    end
    
    def show
        find_contact
        @prospects = Contact.where("email_confirmation = true")
        @list = @prospects.sort_by{ |contact| contact[:validated_on]}
        @position = @list.index{ |contact| contact[:email] == @contact.email} + 1
    end
    
    
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
          ContactMailer.welcome(@contact).deliver_now
          redirect_to root_path
          flash[:success] = "contact successfully created"
        else
          render 'new'
          flash[:error] = "Something went wrong"
        end
    end

    def confirm_email
        @contact = Contact.find_by_confirm_token(params[:id])
        if @contact
            @contact.confirmed!
            @contact.validated_on!
            redirect_to contact_path(@contact)
            flash[:success] = "Added on the wait list !"
        else
            redirect_to root_path
            flash[:error] = "something went wrong"
        end
    end
    
    
    def edit
        find_contact
    end

    def update
        find_contact
        if @contact.update(contact_params)
          redirect_to @contact
          flash[:success] = "contact was successfully updated"
        else
          render 'edit'
          flash[:error] = "Something went wrong"
        end
    end
    
    

    def destroy
        find_contact
        if @contact.destroy
            redirect_to contacts_url
            flash[:success] = 'contact was successfully deleted.'
        else
            redirect_to contacts_url
            flash[:error] = 'Something went wrong'
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
