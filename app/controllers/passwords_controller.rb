class PasswordsController < Devise::PasswordsController

  def forgot
  if params[:email].blank?
    return render json: {error: "Email not present" }
  end

  user = User.find_by(email: params[:email])

  if user.present?
    user.generate_password_token!
    render json: {status: "ok"}, status: :ok
  else
    render json: {error: ["Email address not found. Please check and try again."]}, status: :not_found
  end
end

end
