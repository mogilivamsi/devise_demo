json.(user, :id, :email, :first_name, :last_name, :phone_number)
json.token user.generate_jwt
