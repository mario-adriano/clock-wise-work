# typed: false
# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Authenticator, type: :model) do
  describe "validations" do
    it { is_expected.to(validate_presence_of(:login)) }
    it { is_expected.to(validate_presence_of(:password)) }
    it { should validate_length_of(:password).is_at_least(8) }
  end
end
