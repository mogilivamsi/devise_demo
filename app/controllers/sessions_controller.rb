class SessionsController < Devise::SessionsController
  def create
    # request.formats: ["text/html"]
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      p 111111111111111111111
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end
