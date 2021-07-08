class SearchableModel < ActiveRecord::Base
  include Searchable

  searchable_fields :first_name,:last_name, :email, :phone_number
end