class ClientsController < ApplicationController

    def index
		clients = Client.all
        render json: clients
	end

    def show
        client = Client.find(params[:id])
        if client
            render json: client
        else
            render status: :bad_request, json: {error: client.errors.full_messages}
        end
    end

    def create
        client = Client.new(client_params)
        if client.save
        render json: client
       else
        render text: "client not saved" 
       end
    end

    def update
        client = Client.find(params[:id])
        if client.update(client_params)
            render json: {success: "true"}
        else
            render status: :bad_request, json: {error: client.errors.full_messages}
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