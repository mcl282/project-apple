class MaintenanceThreadsController < ApplicationController
before_action do 
  if current_tenant != nil 
    authenticate_tenant!
  else
    authenticate_manager!
  end
end

  def index
    if tenant_signed_in?
      @maintenance_threads = MaintenanceThread.where(:tenant_id => current_tenant.id)
    elsif 
      @maintenance_threads = MaintenanceThread.where(:maintenance_team_id => current_manager.maintenance_team_id)
    #
    end
  end

  def show
    @maintenance_request = MaintenanceRequest.new
    if tenant_signed_in?
      @tenant = Tenant.find(current_tenant)
      @maintenance_thread = MaintenanceThread.find(params[:id])
      @maintenance_threads = MaintenanceThread.where(:tenant_id => current_tenant.id)
      @maintenance_requests = MaintenanceRequest.where(:maintenance_thread_id => @maintenance_thread.id)
      elsif manager_signed_in?
      @manager = Manager.find(current_manager)
      @maintenance_thread = MaintenanceThread.find(params[:id])
      @maintenance_threads = MaintenanceThread.where(:maintenance_team_id => current_manager.maintenance_team_id)
      @maintenance_requests = MaintenanceRequest.where(:maintenance_team_id => current_manager.maintenance_team_id, :maintenance_thread_id => @maintenance_thread.id)
    end
    
  end

  def new
    @maintenance_thread = MaintenanceThread.new
    @maintenance_thread.maintenance_requests.build
  end

  def create
    @maintenance_thread = current_tenant.maintenance_threads.build(maintenance_thread_params)
    if @maintenance_thread.save
      flash[:success] = "Request successfully submitted!"
      redirect_to @maintenance_thread
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
    def maintenance_thread_params
      params.require(:maintenance_thread).permit(:tenant_id, :maintenance_thread_title, maintenance_requests_attributes: [:id,:tenant_id, :maintenance_thread_id, :request_message])
    end
    



end
