class RegistrationsController < Devise::RegistrationsController
  # def create
  #   user = User.find_by_email(sign_in_params[:email])
  #
  #   if user && user.valid_password?(sign_in_params[:password])
  #     p 111111111111111111111
  #     @current_user = user
  #   else
  #     render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
  #   end
  # end

#   def create
#     p "====sinupppppppppp"
#   p build_resource(sign_up_params)
# p resource
# p  resource.save
#
#   yield resource if block_given?
#   if resource.persisted?
#     if resource.active_for_authentication?
#       set_flash_message! :notice, :signed_up
#       sign_up(resource_name, resource)
#       respond_with resource, location: after_sign_up_path_for(resource)
#     else
#       set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
#       expire_data_after_sign_in!
#       respond_with resource, location: after_inactive_sign_up_path_for(resource)
#     end
#   else
#     clean_up_passwords resource
#     set_minimum_password_length
#     respond_with resource
#   end
# end

end
