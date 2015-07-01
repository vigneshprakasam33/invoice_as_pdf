class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => :index

  # GET /invoices
  # GET /invoices.json
  def index

    @invoice = Invoice.new(:name => "AutoAttend",
                           :number => "001",
                           :from_name => "Vignesh",
                           :from_details => "181-A, South state bank nagar,
Poondurai road,
Erode - 638002,
India",
                           :to_name => "Sindhuja",
                           :to_details => "5E, Dev Apartments,
17, Sundarajan street,
Chennai - 600018,
India",
                           :subtotal => "$1100",
                           :tax => "NA",
                           :total => "$1100",
                           :cover => "Dear Sindhuja,

Please find the invoice for my services. Please complete the payment at your earliest convenience. Do not hesitate to contact me with any questions.

Regards,
Vignesh"

    )
    @invoice.line_items.build(:service => "Design", :quantity => "10 hours", :price => "$10/hr", :subtotal => "$100")
    @invoice.line_items.build(:service => "Development", :quantity => "100 hours", :price => "$10/hr", :subtotal => "$1000")
    5.times do
      @invoice.line_items.build
    end
    #@invoice.line_items.build
    #@invoice.line_items.build
  end

  def generate_pdf
    kit = PDFKit.new('http://localhost:5040')
    #kit.to_file('/uploads')

    #redirect_to invoices_path
    send_file kit.to_pdf, :type => 'application/pdf', :disposition => 'inline'
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.save

    if Rails.env == "development"
      redirect_to "http://localhost:5040/invoices/#{@invoice.id}.pdf"
    elsif Rails.env == "production"
      redirect_to "http://invoiceaspdf.com/invoices/#{@invoice.id}.pdf"
    end

  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invoice_params
    params.require(:invoice).permit(:name, :number, :from, :to, :total, :subtotal, :contact, :from_name, :from_details, :to_name, :to_details, :tax, :cover, :line_items_attributes => [:id, :price, :service, :description, :quantity, :subtotal])
  end
end
