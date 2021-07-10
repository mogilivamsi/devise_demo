json.user do |json|
  # json.partial! 'users/user', user: current_user
  # json.(user, :id, :email, :username, :bio, :image)
  json.otp current_user.current_otp
end
