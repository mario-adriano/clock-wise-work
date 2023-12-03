# typed: false
# frozen_string_literal: true

module AuthenticationHelper
  def authenticate_user(user)
    post("/api/v1/authenticate", params: { login: user.login, password: user.password })
    json_response = JSON.parse(response.body)
    json_response["token"]
  end
end
