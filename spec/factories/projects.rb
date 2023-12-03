# typed: false
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
FactoryBot.define do
  factory :project do
    title { "Blackest Night" }
    description { "Green Lanterns Ash and Saarek find the Black Central Battery" }
  end
end
