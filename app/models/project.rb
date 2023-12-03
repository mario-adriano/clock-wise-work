# typed: false
# == Schema Information
#
# Table name: projects
#
#  id          :uuid             not null, primary key
#  description :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# frozen_string_literal: true

class Project < ApplicationRecord
  validates :title, presence: true

  has_many :project_users
  has_many :users, through: :project_users
  has_many :time_logs
end
