# typed: strict
# frozen_string_literal: true

module Authentication
  class LoginService < Authentication::BaseService
    sig { returns(T.any(T::Hash[T.untyped, T.untyped], T::Boolean)) }
    def call
      authenticator = Authenticator.new(@params)

      return false if authenticator.invalid?

      @user = T.let(User.find_by(login: authenticator.login), T.nilable(User))

      if @user&.authenticate(authenticator.password)
        token = JsonWebToken.encode(user_id: @user.id)
        user_data = UserSerializer.new(@user).serializable_hash

        {
          token: token,
          user: user_data,
        }
      else
        false
      end
    end
  end
end
