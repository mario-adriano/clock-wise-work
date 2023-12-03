# typed: true
# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  email           :string           not null
#  login           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_login  (login) UNIQUE
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :login, :email, :created_at, :updated_at
end
