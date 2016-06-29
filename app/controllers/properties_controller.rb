class PropertiesController < ApplicationController
  
  
  def index
    
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def new
    @property = Property.new
  end
    
  def create
    @property = Property.new(property_params)
    #@property.save
    if @property.save
      flash[:success] = "Property created"
      redirect_to root_path
    else
      flash[:error] = "Property was not created"
      render new_property_path
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
   # if #@user.update_attributes(user_params)
     # flash[:success] = "Profile updated"
      #redirect_to @user
    #else
      #render 'edit'
    #end
  end
  
  def destroy
    #Property.find(params[:id]).destroy
    #flash[:success] = "User deleted"
    #redirect_to users_url
  end
  


private
    def property_params
      params.require(:property).permit(:property_name, :property_address, :building_class, :year_built, :floor_count_building, :unit_count_building, :square_footage_building_total, :description, :cats_and_dogs_allowed, :elevator_building, :full_time_doorman, :concierge, :washer_dryer_in_unit, :laundry_in_building, :fitness_center, :swimming_pool, :parking_available, :common_area, :courtyard_building, :live_in_super, :storage_available, :bikeroom_in_building, :outdoor_space, :deck_building, :roof_deck_building, :terrace_building)
    end

end


