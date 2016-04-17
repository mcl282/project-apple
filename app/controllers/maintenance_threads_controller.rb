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
    #allows tenant to create a new request from the threads show page
    @maintenance_request = MaintenanceRequest.new
    
    #allows tenant to create a new request from the threads show page
    @maintenance_thread = MaintenanceThread.find(params[:id])
    
    if tenant_signed_in?
      @tenant = Tenant.find(current_tenant)
      @maintenance_threads = MaintenanceThread.where(:tenant_id => current_tenant.id)
      @maintenance_requests = MaintenanceRequest.where(:maintenance_thread_id => @maintenance_thread.id)
      elsif manager_signed_in?
      @manager = Manager.find(current_manager)
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
    @maintenance_thread = MaintenanceThread.find(params[:id])
  end

  def update
    @maintenance_thread = MaintenanceThread.find(params[:id])
    if @maintenance_thread.update(close_thread_params)
      flash[:success] = "Thread closed"
      redirect_to maintenance_threads_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def maintenance_thread_params
      params.require(:maintenance_thread).permit(:tenant_id, :maintenance_thread_title,:thread_open, maintenance_requests_attributes: [:id,:tenant_id, :maintenance_thread_id, :request_message])
    end
    
    def close_thread_params
      params.permit(:thread_open)
    end
    



end
