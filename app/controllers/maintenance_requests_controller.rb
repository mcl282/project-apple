class MaintenanceRequestsController < ApplicationController
before_action do 
  if current_tenant != nil 
    authenticate_tenant!
  else
    authenticate_manager!
  end
end


  def index
    
  end

  def show
    @tenant = Tenant.find(current_tenant)
    @tenant = Manager.find(current_manager)
    @maintenance_request = MaintenanceRequest.find(params[:id])
    @maintenance_requests = MaintenanceRequest.where("tenant_id = current_tenant.id' OR manager_id = current_manager.id")
    @maintenance_thread = MaintenanceThread.find(params[:id])
    
    #tenant_id: current_tenant.id
  end

  def new
    @maintenance_request = MaintenanceRequest.new
  end

  def create
    if tenant_signed_in?
      @maintenance_request = current_tenant.maintenance_requests.build(maintenance_request_params)
      elsif manager_signed_in?
        @maintenance_request = current_manager.maintenance_requests.build(maintenance_request_params)
        #THIS NEEDS TO BE FIXED!!
    end
        
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
      if tenant_signed_in?
        params.require(:maintenance_request).permit(:request_message, :tenant_id, :maintenance_team_id, :maintenance_thread_id)
        elsif manager_signed_in?
        params.require(:maintenance_request).permit(:request_message, :manager_id, :maintenance_team_id, :maintenance_thread_id)
      end
    end

end

