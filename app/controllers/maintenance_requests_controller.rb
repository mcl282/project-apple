class MaintenanceRequestsController < ApplicationController
before_action :authenticate_tenant!
before_create :signed_in_tenant_created_request

  def index
    
  end

  def show
    @tenant = Tenant.find(current_tenant)
    @maintenance_request = MaintenanceRequest.find(params[:id])
    @maintenance_requests = MaintenanceRequest.where(tenant_id: current_tenant.id)
  end

  def new
    @maintenance_request = MaintenanceRequest.new
  end

  def create
    @maintenance_request = current_tenant.maintenance_requests.build(maintenance_request_params)
    if @maintenance_request.save
      flash[:success] = "Request successfully submitted!"
      redirect_to maintenance_request_path(current_tenant) 
    else
      flash[:unsuccessful] = "Request was not submitted, please try again."
    end
  
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def maintenance_request_params
      params.require(:maintenance_request).permit(:request_message)
    end

    def signed_in_tenant_created_request
      tenant_id == current_tenant.id?
    end
end
