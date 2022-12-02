class InvoicesController < ApplicationController
    require 'sendgrid-ruby'
    include SendGrid

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
            mail.template_id = 'd-144bf57998874665a4174110fa21cd8f'

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
            mail.template_id = 'd-144bf57998874665a4174110fa21cd8f'

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

    # def sendgridemail(invoice)
            # mail = SendGrid::Mail.new
            # mail.from = SendGrid::Email.new(email: 'studentfaruk0308@gmail.com')
            #mail.subject = "You have a new invoice"


            # personalization = SendGrid::Personalization.new
            # personalization.add_to(SendGrid::Email.new(email: 'studentfaruk0308@gmail.com'))
            #personalization.add_from(SendGrid::Email.new(email: 'studentfaruk0308@gmail.com', name: "Student"))
            #personalization.subject = "You have a new invoice"
            #personalization.add_header(Header.new(key: 'X-Test', value: 'True'))
            #personalization.add_header(Header.new(key: 'X-Mock', value: 'False'))
            # personalization.add_to(SendGrid::Email.new(email: invoice.client_details['email']))
            # @json = invoice_params
            # @json['client_details'] = invoice.client_details
            # @json['profile_details'] = invoice.profile_details
            # @json['sum_amount'] = invoice_params['quantity'] * invoice_params['unit_price']
            # @json['total_amount'] = @json['sum_amount'] + (@json['sum_amount']*@json['tax'])/100
            # @json['due_amount'] = @json['total_amount'] - @json['paid_amount']
            # personalization.add_dynamic_template_data(@json)
            # mail.add_personalization(personalization)
            # mail.template_id = 'd-144bf57998874665a4174110fa21cd8f'

            #mail_settings = MailSettings.new
            #mail_settings.bypass_list_management = BypassListManagement.new(enable: true)
            #mail_settings.sandbox_mode = SandBoxMode.new(enable: true)
            #mail_settings.spam_check = SpamCheck.new(enable: true, threshold: 1, post_to_url: 'https://spamcatcher.sendgrid.com')
            #mail.mail_settings = mail_settings
            
    #         sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    #         puts mail.to_json
    #         begin
    #             response = sg.client.mail._("send").post(request_body: mail.to_json)
    #             puts response.status_code
    #             puts response.body
    #             puts response.parsed_body
    #             puts response.headers
    #         rescue Exception => e
    #             puts e.message
    #             puts "ERROR"
    #         end
    # end

end
