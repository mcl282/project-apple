class UnitsController < ApplicationController

  def new
    @property = Property.find(params[:property_id])
    @unit = @property.units.new
  end

  def create
    @unit = Unit.new(unit_params)
    @property = Property.find(params[:property_id])
    if @unit.save
      flash[:success] = "Unit created!"
      redirect_to edit_property_path @property
    else
      flash[:error] = "Property was not created"
      redirect_to :back
    end
  end

  def edit
    @unit = Unit.find(params[:id])
    @property = Property.find(@unit.property_id)

  end

  def update
    @unit = Unit.find(params[:id])
    @property = Property.find(@unit.property_id)
    if @unit.update_attributes(unit_params)
      flash[:success] = "Unit was successfully updated."
      redirect_to edit_property_path @property
    else
      flash[:error] = "Unit was not created"
      redirect_to :back
    end
  end
  
private
    def unit_params
      params.require(:unit).permit(:balcony, :bathrooms, :bedrooms, :cable_and_internet, :central_air_conditioning, :deck, :disability_access, :dishwasher, :fireplace, :floors, :loft, :manager_id, :microwave, :pre_furnished, :property_id, :roof_deck, :square_feet_unit, :storage_available, :tenant_id, :terrace, :total_rooms, :unit_description, :unit_label, :unit_floor, :washer_dryer_in_unit)
    end

end


