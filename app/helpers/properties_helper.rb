module PropertiesHelper
  def submit_button_text(object)
    object.new_record? ? "Add Building" : "Edit Building" 
  end

end
