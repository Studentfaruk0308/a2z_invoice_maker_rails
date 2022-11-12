class ClientsController < ApplicationController

    def index
		clients = Client.all
        render json: clients
	end

    def show
        client = Client.find(params[:id])
    end

    def edit
        client = Client.find(params[:id])
    end

    def create
        client = Client.new(client_params)
        if client.save
        render json: client
       else
        render text: "client not saved" 
       end
    end

    

    private
  
    def client_params
        params.require(:client).permit(:id, :company_name, :contact_person_name, :email, :mobile_number, :phone_number, :postal_address)
    end


end


# t.string "company_name"
# t.string "contact_person_name"
# t.string "email"
# t.string "mobile_number"
# t.string "phone_number"
# t.string "postal_address"