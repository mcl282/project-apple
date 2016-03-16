class Manager::SessionsController < Devise::SessionsController
 before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super do |resource|
       new_location_log(resource)
     end
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.for(:sign_in) << :attribute
   end
   
   def new_location_log(resource)
     ip = resource.current_sign_in_ip
     id = resource.id
     LocationLog.create(id: id, ip_address: ip)
   end
end
