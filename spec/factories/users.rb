# typed: false
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
FactoryBot.define do
  factory :user do
    name { "Richard John Grayson" }
    email { "richard-grayson@gmail.com" }
    login { "nightwing" }
    password { "BetteKane123" }

    factory :new_user do
      email { "dick-grayson@gmail.com" }
      login { "dick" }
    end
  end
end
