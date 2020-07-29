# frozen_string_literal: true

json.user do
  json.name @current_user.name
  json.email @current_user.email
end
