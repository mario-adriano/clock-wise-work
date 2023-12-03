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
require "rails_helper"

RSpec.describe(User, type: :model) do
  describe "database column" do
    it { is_expected.to(have_db_column(:id).of_type(:uuid)) }
    it { is_expected.to(have_db_column(:email).of_type(:string)) }
    it { is_expected.to(have_db_column(:login).of_type(:string)) }
    it { is_expected.to(have_db_column(:name).of_type(:string)) }
    it { is_expected.to(have_db_column(:password_digest).of_type(:string)) }
    it { is_expected.to(have_db_column(:created_at).of_type(:datetime)) }
    it { is_expected.to(have_db_column(:updated_at).of_type(:datetime)) }
  end

  describe "indexes" do
    it { should have_db_index(:login) }
    it { should have_db_index(:email) }
  end

  describe "when all attributes are valid" do
    subject { build(:user) }
    it { is_expected.to(be_valid) }
  end

  describe "attributes consistency after persistence" do
    subject(:user) { create(:user) }

    it { expect(user.email).to(eq(FactoryBot.attributes_for(:user)[:email])) }
    it { expect(user.login).to(eq(FactoryBot.attributes_for(:user)[:login])) }
    it { expect(user.name).to(eq(FactoryBot.attributes_for(:user)[:name])) }
  end

  describe "validations" do
    subject { build(:user) }

    it { is_expected.to(validate_presence_of(:email)) }
    it { is_expected.to(validate_uniqueness_of(:email)) }
    it { should allow_value("richard-grayson@gmail.com").for(:email) }
    it { should allow_value("richard.grayson+tag@example.co.br").for(:email) }
    it { should_not allow_value("richard").for(:email) }
    it { should_not allow_value("richard@").for(:email) }
    it { should_not allow_value("richard@.com").for(:email) }
    it { should_not allow_value("richard@gmail").for(:email) }
    it { should_not allow_value("richard@gmail..com").for(:email) }
    it { is_expected.to(validate_presence_of(:login)) }
    it { is_expected.to(validate_uniqueness_of(:login)) }
    it { should_not allow_value("richard grayson").for(:login).with_message("must not contain spaces") }
    it { is_expected.to(validate_presence_of(:name)) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe "associations" do
    it { should have_many(:projects).through(:project_users).class_name("Project") }
  end

  describe "callbacks" do
    context "before saving" do
      it "downcases the email" do
        user = build(:user)
        user.email = "DICK-GRAYSON@GMAIL.COM"
        user.save
        expect(user.reload.email).to(eq("dick-grayson@gmail.com"))
      end
    end
  end
end
