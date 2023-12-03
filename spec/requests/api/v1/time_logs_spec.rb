# typed: false
# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Api::V1::TimeLogs", type: :request) do
  let!(:user) { create(:user) }
  let(:headers) do
    token = authenticate_user(user)
    { "Authorization" => "Bearer #{token}" }
  end

  describe "GET #show" do
    context "when the time_logs exists in the database" do
      let(:time_log) { create(:time_log) }
      let(:path) { "/api/v1/projects/#{time_log.project.id}/times" }

      before { get path, headers: headers }

      it "returns with 200" do
        expect(response.status).to(eq(200))
      end
    end

    context "when the time_log does not exists in the database" do
      let(:path) { "/api/v1/projects/123/times" }

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
    let(:time_log) { create(:time_log) }
    let(:new_attributes) do
      {
        started_at: Time.now,
        ended_at: Time.now + 1.day,
      }
    end

    context "when the project exists in the database" do
      let(:path) { "/api/v1/time_logs/#{time_log.id}" }

      before do
        put path, params: new_attributes, headers: headers
      end

      it "updates the started_at and ended_at of the time_log" do
        time_log = JSON.parse(response.body)["time_log"]
        expect(time_log).to(eq(new_attributes[:time_log]))
      end

      it "responds with 200" do
        expect(response.status).to(eq(200))
      end

      it "returns the project json" do
        expect(JSON.parse(response.body)["title"]).to(eq(new_attributes[:title]))
      end
    end

    context "when the project does not exist in the database" do
      let(:path) { "/api/v1/time_logs/123" }

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
    let(:path) { "/api/v1/time_logs" }

    context "when the data is ok" do
      let(:project) { create(:project) }
      let(:new_user) { create(:new_user) }
      let(:new_time_log) do
        {
          project_id: project.id,
          user_id: new_user.id,
          started_at: Time.now,
          ended_at: Time.now + 1.day,
        }
      end

      before do
        post path, params: new_time_log, headers: headers
      end

      it "returns with 201" do
        expect(response.status).to(eq(201))
      end
    end

    context "when the data is wrong" do
      let(:new_time_log) do
        {
          project: nil,
          user: nil,
          started_at: nil,
          ended_at: nil,
        }
      end

      before do
        post path, params: new_time_log, headers: headers
      end

      it "returns with 422" do
        expect(response.status).to(eq(422))
      end
    end
  end
end
