class DeliveryPartnersController < ApplicationController
  def index
    @delivery_partners = DeliveryPartner.all
  end

  def new
    @delivery_partner = DeliveryPartner.new
  end

  def create
    @delivery_partner = DeliveryPartner.new(delivery_partner_params)
    if @delivery_partner.save
      flash[:success] = "Delivery partner added successfully"
      redirect_to root_path
    else
      render action:'new'
    end    
  end  

  private

  def delivery_partner_params
    params.require(:delivery_partner).permit(:name, :email)
  end  
end
