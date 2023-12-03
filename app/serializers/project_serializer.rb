# frozen_string_literal: true

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
# typed: false

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :updated_at

  has_many :users, serializer: UserSerializer
end
