class MaintenanceThreadsController < ApplicationController
before_action :authenticate_tenant!

  def index
    
  end

  def show
    @tenant = Tenant.find(current_tenant)
    @maintenance_thread = MaintenanceThread.find(params[:id])
    @maintenance_threads = MaintenanceThread.where(:tenant_id => current_tenant.id)
    @maintenance_requests = MaintenanceRequest.where(:tenant_id => current_tenant.id)
    
  end

  def new
    @maintenance_thread = MaintenanceThread.new
    @maintenance_thread.maintenance_requests.build
  end

  def create
    @maintenance_thread = current_tenant.maintenance_threads.build(maintenance_thread_params)
    #@maintenance_thread.maintenance_requests.first.tenant_id = current_tenant.id
    if @maintenance_thread.save
      flash[:success] = "Request successfully submitted!"
      redirect_to maintenance_thread_path(current_tenant) 
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
