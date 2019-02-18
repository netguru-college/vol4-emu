class Users::RegistrationsController < Devise::RegistrationsController
    def edit
      resource.skills.build
      render :edit
    end
  end