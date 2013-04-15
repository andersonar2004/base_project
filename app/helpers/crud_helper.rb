module CrudHelper


  #Retorna os valores default para os botoes da listagem
  def get_default_action_button(action_button)
    return {add: true, edit: true, destroy: true} if action_button.nil?

    [:add, :edit, :destroy].each do |btn|
      action_button[btn] = true if action_button[btn].nil? 
    end
    action_button
  end
end
