module UnitsHelper
  def submit_button_text(object)
    object.new_record? ? "Add Unit" : "Update Unit" 
  end
end
