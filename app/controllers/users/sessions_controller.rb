class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      teams_path
    else
      super
    end
  end
end
