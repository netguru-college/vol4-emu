class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
       :account_update,
        keys: [
          :email, :username, :password, :password_confirmation, :current_password, 
          :avatar, :description, :city,
          skills_attributes: [:level, :sport_id, :_destroy] 
        ]
      )
  end  

end