# typed: true
# frozen_string_literal: true

require "jwt"
require "sorbet-runtime"

class JsonWebToken
  SECRET_KEY = Rails.application.credentials.jwt.secret_access_key

  class << self
    extend T::Sig

    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end

    sig { params(token: String).returns(HashWithIndifferentAccess) }
    def decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new(decoded)
    end
  end
end
