class ShipmentsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @shipments = current_customer.shipments
  end
  
  def new
    @shipment = current_customer.shipments.new
  end
  
  def create
    @shipment = current_customer.shipments.build(shipment_params)
    if @shipment.save
      redirect_to customer_shipments_path
    else
      render 'new'
    end    
  end

  def edit
    @shipment = Shipment.find(params[:id])
  end  

  def update
    @shipment = Shipment.find(params[:id])
    if @shipment.update(shipment_params)
      flash[:success] = "successfully saved"
      
    else
      flash[:error] = @shipment.errors
    end    
    redirect_to customer_shipments_path
  end  

  
  private
  
  def shipment_params
    params.require(:shipment).permit(:source, :target, :customer_id, :delivery_partner_id, :status, :item)
  end  
end
