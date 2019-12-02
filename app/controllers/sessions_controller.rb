class SessionsController < Devise::SessionsController
  
  def new
    super
  end

  def create

    if resource = User.where(email: resource_params[:email]).first

      if resource.valid_password?(params[:user][:password])
        sign_in(resource)
        respond_with resource, :location => after_sign_in_path_for(resource)
      else

      end
    else
      resource = User.new(resource_params)
      if resource.save
        sign_in(resource)
        respond_with resource, :location => after_sign_in_path_for(resource)
      else
      end
    end
  end

  private
  def resource_params
    params.require(:user).permit(:email, :password)
  end
end