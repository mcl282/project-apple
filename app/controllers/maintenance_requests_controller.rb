class MaintenanceRequestsController < ApplicationController
before_action :authenticate_tenant!

  def index
    
  end

  def show
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

end
