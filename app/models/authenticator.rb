# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"

class Authenticator
  include ActiveModel::Model

  extend T::Sig

  sig { returns(T.nilable(String)) }
  attr_accessor :login, :password

  validates :login, presence: true, format: { without: /\s/ }
  validates :password, presence: true, length: { minimum: 8 }
end
