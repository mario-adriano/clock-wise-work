# typed: strict
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

class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, "valid_email_2/email": true
  validates :login, presence: true, uniqueness: true, format: { without: /\s/, message: "must not contain spaces" }
  validates :password,
    length: { minimum: 8 },
    if: -> { T.unsafe(self).new_record? || !T.unsafe(self).password.nil? }

  has_many :project_users
  has_many :projects, through: :project_users

  private

  sig { void }
  def downcase_email
    email.downcase!
  end
end
