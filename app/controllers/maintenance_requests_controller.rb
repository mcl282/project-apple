class MaintenanceRequestsController < ApplicationController
before_action :authenticate_tenant!


  def index
    
  end

  def show
    @tenant = Tenant.find(current_tenant)
    @maintenance_request = MaintenanceRequest.find(params[:id])
    @maintenance_requests = MaintenanceRequest.where(tenant_id: current_tenant.id)
    @maintenance_thread = MaintenanceThread.find(params[:id])
  end

  def new
    @maintenance_request = MaintenanceRequest.new
  end

  def create
    @maintenance_request = current_tenant.maintenance_requests.build(maintenance_request_params)
    if @maintenance_request.save
      flash[:success] = "Request successfully submitted!"
      redirect_to :back
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
      params.require(:maintenance_request).permit(:request_message, :tenant_id, :maintenance_team_id, :maintenance_thread_id)
    end

end

