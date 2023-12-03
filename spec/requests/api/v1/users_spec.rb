# typed: false
# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Api::V1::Users", type: :request) do
  let!(:user) { create(:user) }
  let(:headers) do
    token = authenticate_user(user)
    { "Authorization" => "Bearer #{token}" }
  end

  describe "GET #show" do
    context "when the user exists in the database" do
      let(:user) { create(:user) }
      let(:path) { "/api/v1/users/#{user.id}" }

      it "returns with 200" do
        get path, headers: headers
        expect(response.status).to(eq(200))
      end
    end

    context "when the user does not exists in the database" do
      let(:path) { "/api/v1/users/123" }

      before do
        get path, headers: headers
      end

      it "returns with 404" do
        expect(response.status).to(eq(404))
      end

      it "returns a json with 'record not found'" do
        expect(response.body).to(eq({ error: "Record not found" }.to_json))
      end
    end
  end

  describe "PUT #update" do
    let(:user) { create(:user) }
    let(:new_attributes) { { name: "Dick Grayson", login: "dick-grayson", email: "dickgrayson@gmail.com" } }

    context "when the user exists in the database" do
      let(:path) { "/api/v1/users/#{user.id}" }

      before do
        put path, params: new_attributes, headers: headers
      end

      it "updates the name, login and email of the user" do
        user = JSON.parse(response.body)["user"]
        expect(user).to(eq(new_attributes[:user]))
      end

      it "responds with 200" do
        expect(response.status).to(eq(200))
      end

      it "returns the user json" do
        expect(JSON.parse(response.body)["name"]).to(eq(new_attributes[:name]))
      end
    end

    context "when the user does not exist in the database" do
      let(:path) { "/api/v1/users/123" }

      before do
        put path, params: new_attributes, headers: headers
      end

      it "returns with 404" do
        expect(response.status).to(eq(404))
      end
      it "returns a json with 'record not found'" do
        expect(response.body).to(eq({ error: "Record not found" }.to_json))
      end
    end
  end

  describe "POST #create" do
    let(:path) { "/api/v1/users" }

    context "when the data is ok" do
      let(:new_user) do
        {
          name: "Dick Grayson",
          login: "dick-grayson",
          email: "dickgrayson@gmail.com",
          password: "12345678",
        }
      end

      before do
        post path, params: new_user, headers: headers
      end

      it "returns with 201" do
        expect(response.status).to(eq(201))
      end
    end

    context "when the data is wrong" do
      let(:new_user) do
        {
          name: "",
          login: "",
          email: "",
          password: "",
        }
      end

      before do
        post path, params: new_user, headers: headers
      end

      it "returns with 422" do
        expect(response.status).to(eq(422))
      end
    end
  end
end
