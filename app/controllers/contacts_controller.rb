class ContactsController < ApplicationController
   
    def show
        find_contact
        if @contact.validated_on.nil? && @contact.email_confirmation == false 
            @text = "Tu n'as pas encore de position dans la liste! verifie tes emails 🙂"
            @position = "Inscritpion non confirmée"
        elsif @contact.validated_on != nil && @contact.email_confirmation == false
            @text = "Ton inscription sur la liste est bien annulée. N'hésites pas à revenir."
            @position = "😢"
        elsif @contact.email_confirmation == true && @contact.renewed_on !=nil
            @prospects = Contact.where("email_confirmation = true")
            @list = @prospects.sort_by{ |contact| contact[:validated_on]}
            @text = "Ta position dans la liste d'attente est bien renouvellée à la place suivante:"
            @position = @list.index{ |contact| contact[:email] == @contact.email} + 1
        else
            @prospects = Contact.where("email_confirmation = true")
            @list = @prospects.sort_by{ |contact| contact[:validated_on]}
            @text = "Ta position dans la liste d'attente est la suivante:"
            @position = @list.index{ |contact| contact[:email] == @contact.email} + 1
        end
    end
    
    
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
          ContactMailer.welcome(@contact).deliver_later
          flash[:notice] = "contact successfully created"
          redirect_to root_path
          
        else
          flash[:notice] = "Something went wrong"
          render 'new'
          
        end
    end

    def confirm_email
        @contact = Contact.find_by_confirm_token(params[:id])
        if @contact
            @contact.confirmed!
            @contact.validated_on!
            ContactMailer.renew(@contact).deliver_later(wait_until: 15.days.from_now)
            Check20Job.set(wait_until: 20.days.from_now).perform_later(@contact.id)
            flash[:notice] = "Added on the wait list !"
            redirect_to contact_path(@contact)
            
        else
            flash[:notice] = "something went wrong"
            redirect_to root_path
            
        end
    end

    def renew_email
        @contact = Contact.find_by_confirm_token(params[:id])
        if @contact
            @contact.renew!
            ContactMailer.renew(@contact).deliver_later(wait_until: 15.days.from_now)
            Check20Job.set(wait_until: 20.days.from_now).perform_later(@contact.id)
            flash[:notice] = "Position confirmed!"
            redirect_to contact_path(@contact)
            
        else
            flash[:notice] = "something went wrong"
            redirect_to root_path
            
        end
    end
    
    def optout_email
        @contact = Contact.find_by_confirm_token(params[:id])
        if @contact
            @contact.optout!
            flash[:notice] = "Removed from the list!"
            redirect_to contact_path(@contact)
            
        else
            flash[:notice] = "something went wrong"
            redirect_to root_path
            
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
