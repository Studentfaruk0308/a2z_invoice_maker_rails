class InvoicesController < ApplicationController
    def index
		invoices = Invoice.all
        render json: invoices
	end

    def show
        invoice = Invoice.find(params[:id])
        render json: invoice
    end

    def edit
        invoice = Invoice.find(params[:id])
    end

    def create
        invoice = Invoice.new(invoice_params)

        if invoice.valid?
            invoice.save
            render json: invoice
        else
            render status: :bad_request, json: {error: invoice.errors.full_messages}
       end
    end

    

    private
  
    def invoice_params
        params.require(:invoice).permit(:id, :inv_number, :date_of_issue, :due_date, :job_reference, :description, :quantity, :unit_price, :sum_amount, :tax, :total_amount, :paid_amount, :due_amount, :client_id)
    end

    def client_params
        params.require(:client).permit(:client_id)
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