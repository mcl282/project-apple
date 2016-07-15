class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def hello
    render text: "hello, world!"
  end

  protected
    def authenticate_inviter!
      authenticate_manager!(:force => true)
    end
    
    def after_invite_path_for(resource)
      new_tenant_invitation_path  
    end

end
