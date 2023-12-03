# typed: false
# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Api::V1::Authentications", type: :request) do
  describe "POST /login" do
    let(:path) { "/api/v1/authenticate" }

    context "when the user exists in the database" do
      let(:user) { create(:user) }
      let(:params) { { login: user.login, password: user.password } }

      before { post path, params: params }

      it "returns with 200" do
        expect(response.status).to(eq(200))
      end

      it "returns a token" do
        json_response = JSON.parse(response.body)
        expect(json_response).to(have_key("token"))
        expect(json_response["token"]).not_to(be_nil)
      end

      it "returns a user" do
        expect(JSON.parse(response.body)["user"].as_json).to(eq(UserSerializer.new(user).serializable_hash.as_json))
      end
    end

    context "when the user does not exist in the database" do
      let(:params) { { login: "Ra's al Ghul", password: "damianWayne" } }

      before { post path, params: params }

      it "returns with 401" do
        expect(response.status).to(eq(401))
      end

      it "return error message with unauthorized" do
        expect(response.body).to(eq({ error: "unauthorized" }.to_json))
      end
    end
  end
end
