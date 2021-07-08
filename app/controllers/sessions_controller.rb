class SessionsController < Devise::SessionsController


  def create
    # super
    # verification_params = params.permit(:mobile, :passcode)
    @user = User.find_by_email(sign_in_params[:email])

    if  @user && @user.confirmed? && @user.verify_passcode(sign_in_params[:otp_attempt])
      if  @user.valid_password?(sign_in_params[:password])
      @current_user = @user
      else
        render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
    else
      if !@user.confirmed?
        render json: { errors: { 'email' => ['is not conformed'] } }, status: :unprocessable_entity

      else
        render json: { errors: { 'OTP' => ['is Expired'] } }, status: :unprocessable_entity

      end
    end

  end

  def verify_login
    # request.formats: ["text/html"]
    user = User.find_by_email(sign_in_params[:email])

    if user && user.confirmed? && user.valid_password?(sign_in_params[:password])

      if user.send_passcode
        render(json: {message: 'Sent passccode'}, status: :ok)
      else
        render(json: {error: 'failed to send passcode'}, status: :unauthorized)
      end
      UserMailer.with(user: user).send_otp_mail.deliver_now
      @current_user = user
    else
      if !user.confirmed?
        render json: { errors: { 'email' => ['is not confirmed'] } }, status: :unprocessable_entity

      else
        render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity

      end
    end

  end

end
