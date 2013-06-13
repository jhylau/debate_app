module DebateHelper
  def join_button_class(side)
    if current_user = side.user
      
    else
      return "disabled"
    end
  end
end
