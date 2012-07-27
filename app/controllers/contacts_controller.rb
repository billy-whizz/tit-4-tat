class ContactsController < ApplicationController
before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
before_filter :admin_user, :only => :destroy
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])

    
      if @contact.save
         redirect_to @contact
         flash[:success]='Thank you for your enquiry.We will get back to you within 24 hours.' 
        
      else
      render action: "new"
      end
    end
 

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

      if @contact.update_attributes(params[:contact])
       redirect_to @contact
       flash[:success]='Information was successfully updated.' 
    
      else
       render action: "edit" 
       render json: @contact.errors, status: :unprocessable_entity 
      end
    end
  
  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end
  private
def authenticate
deny_access unless signed_in?
end
def correct_user
@user = User.find(params[:id])
redirect_to(root_path) unless current_user?(@user)
end
end
