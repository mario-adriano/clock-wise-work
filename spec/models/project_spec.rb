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
require "rails_helper"

RSpec.describe(Project, type: :model) do
  describe "database column" do
    it { is_expected.to(have_db_column(:id).of_type(:uuid)) }
    it { is_expected.to(have_db_column(:title).of_type(:string)) }
    it { is_expected.to(have_db_column(:description).of_type(:string)) }
  end

  describe "when all attributes are valid" do
    subject { build(:project) }
    it { is_expected.to(be_valid) }
  end

  describe "attributes consistency after persistence" do
    subject(:project) { create(:project) }

    it { expect(project.title).to(eq(FactoryBot.attributes_for(:project)[:title])) }
    it { expect(project.description).to(eq(FactoryBot.attributes_for(:project)[:description])) }
  end

  describe "validations" do
    it { is_expected.to(validate_presence_of(:title)) }
  end

  describe "associations" do
    it { should have_many(:users).through(:project_users).class_name("User") }
    it { should have_many(:time_logs).class_name("TimeLog") }
  end
end
