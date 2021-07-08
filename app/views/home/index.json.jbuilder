json.array! @users do |category|
  json.partial! 'users/user', user: category
end