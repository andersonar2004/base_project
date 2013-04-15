class UsersController < CrudController
  load_and_authorize_resource
  
  protected

  def collection
    params[:q] = {} if params[:q].blank?

    @q = User.accessible_by(current_ability).search(params[:q])
    @usuarios = @q.result.order(:email).page(params[:page])

  end 

end
