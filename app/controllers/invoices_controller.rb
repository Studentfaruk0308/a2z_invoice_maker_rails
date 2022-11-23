class InvoicesController < ApplicationController
    def index
		invoices = Invoice.all
        user = request.headers["Authorization"]
        filteredInvoices = invoices.select {|i| i.profile_id == user}
        puts user
        render json: filteredInvoices
	end

    def show
        invoice = Invoice.find(params[:id])
        render json: invoice, methods: [:client_details, :profile_details]
        # render json: invoice.to_json(:include => {:client, :profile})
    end

    def edit
        invoice = Invoice.find(params[:id])
    end

    def create
        invoice = Invoice.new(invoice_params)

        if invoice.valid?
            invoice.save

            mail = SendGrid::Mail.new
            mail.from = SendGrid::Email.new(email: 'studentfaruk0308@gmail.com')
            personalization = SendGrid::Personalization.new
            personalization.add_to(SendGrid::Email.new(email: invoice.client_details['email']))
            @json = invoice_params
            @json['client_details'] = invoice.client_details
            @json['profile_details'] = invoice.profile_details
            @json['sum_amount'] = invoice_params['quantity'] * invoice_params['unit_price']
            @json['total_amount'] = @json['sum_amount'] + (@json['sum_amount']*@json['tax'])/100
            @json['due_amount'] = @json['total_amount'] - @json['paid_amount']
            personalization.add_dynamic_template_data(@json)
            mail.add_personalization(personalization)
            mail.template_id = 'd-3c3dc6e62cf64f6a9bf6fe84af22ef71'
            
            sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
            puts mail.to_json
            begin
                response = sg.client.mail._("send").post(request_body: mail.to_json)
                puts response.status_code
                puts response.body
                puts response.parsed_body
                puts response.headers
            rescue Exception => e
                puts e.message
                puts "ERROR"
            end

            render json: invoice
        else
            render status: :bad_request, json: {error: invoice.errors.full_messages}
       end
    end

    def update
        invoice = Invoice.find(params[:id])

        if invoice.update(invoice_params) 
            mail = SendGrid::Mail.new
            mail.from = SendGrid::Email.new(email: 'studentfaruk0308@gmail.com')
            personalization = SendGrid::Personalization.new
            personalization.add_to(SendGrid::Email.new(email: invoice.client_details['email']))
            @json = invoice_params
            @json['client_details'] = invoice.client_details
            @json['profile_details'] = invoice.profile_details
            @json['sum_amount'] = invoice_params['quantity'] * invoice_params['unit_price']
            @json['total_amount'] = @json['sum_amount'] + (@json['sum_amount']*@json['tax'])/100
            @json['due_amount'] = @json['total_amount'] - @json['paid_amount']
            personalization.add_dynamic_template_data(@json)
            mail.add_personalization(personalization)
            mail.template_id = 'd-3c3dc6e62cf64f6a9bf6fe84af22ef71'
            
            sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
            puts mail.to_json
            begin
                response = sg.client.mail._("send").post(request_body: mail.to_json)
                puts response.status_code
                puts response.body
                puts response.parsed_body
                puts response.headers
            rescue Exception => e
                puts e.message
                puts "ERROR"
            end

            render json: {success: "true"}
        else
            render status: :bad_request, json: {error: invoice.errors.full_messages}
        end
    end
    

    private
  
    def invoice_params
        params.require(:invoice).permit(:id, :inv_number, :date_of_issue, :due_date, :job_reference, :description, :quantity, :unit_price, :sum_amount, :tax, :total_amount, :paid_amount, :due_amount, :client_id, :profile_id)
    end

    def client_params
        params.require(:client).permit(:client_id)
    end

    def profile_params
        params.require(:profile).permit(:profile_id)
    end

end


# t.string "inv_number"
# t.datetime "date_of_issue"
# t.datetime "due_date"
# t.string "job_reference"
# t.string "description"
# t.integer "quantity"
# t.integer "unit_price"
# t.integer "sum_amount"
# t.integer "tax"
# t.integer "total_amount"
# t.integer "paid_amount"
# t.integer "due_amount"
# t.integer "client_id", null: false