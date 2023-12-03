# typed: false
# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Api::V1::Projects", type: :request) do
  let!(:user) { create(:user) }
  let(:headers) do
    token = authenticate_user(user)
    { "Authorization" => "Bearer #{token}" }
  end

  describe "GET /index" do
    let(:path) { "/api/v1/projects" }

    context "when there are projects in the database" do
      before do
        create_list(:project, 3)
        get path, headers: headers
      end

      it "returns with 200" do
        expect(response.status).to(eq(200))
      end

      it "returns a list of projects" do
        expect(JSON.parse(response.body).size).to(eq(3))
      end
    end

    context "when there are no projects in the database" do
      before { get path, headers: headers }

      it "returns with 200" do
        expect(response.status).to(eq(200))
      end

      it "returns an empty list" do
        expect(JSON.parse(response.body)).to(be_empty)
      end
    end
  end

  describe "GET #show" do
    context "when the project exists in the database" do
      let(:project) { create(:project) }
      let(:path) { "/api/v1/projects/#{project.id}" }

      before { get path, headers: headers }

      it "returns with 200" do
        expect(response.status).to(eq(200))
      end
    end

    context "when the project does not exists in the database" do
      let(:path) { "/api/v1/projects/123" }

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
    let(:project) { create(:project) }
    let(:new_attributes) do
      {
        title: "Tower of Babel",
        description: "Tower of Babel deals with Batman's perceived betrayal of the superhuman community by keeping",
      }
    end

    context "when the project exists in the database" do
      let(:path) { "/api/v1/projects/#{project.id}" }

      before do
        put path, params: new_attributes, headers: headers
      end

      it "updates the title and description of the project" do
        project = JSON.parse(response.body)["project"]
        expect(project).to(eq(new_attributes[:project]))
      end

      it "responds with 200" do
        expect(response.status).to(eq(200))
      end

      it "returns the project json" do
        expect(JSON.parse(response.body)["title"]).to(eq(new_attributes[:title]))
      end
    end

    context "when the project does not exist in the database" do
      let(:path) { "/api/v1/projects/123" }

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
    let(:path) { "/api/v1/projects" }

    context "when the data is ok" do
      let(:new_project) do
        {
          title: "The Man Behind a Red Hood",
          description: "The Red Hood is an alias used by multiple characters appearing.",
        }
      end

      before do
        post path, params: new_project, headers: headers
      end

      it "returns with 201" do
        expect(response.status).to(eq(201))
      end
    end

    context "when the data is wrong" do
      let(:new_project) do
        {
          title: "",
          description: "",
        }
      end

      before do
        post path, params: new_project, headers: headers
      end

      it "returns with 422" do
        expect(response.status).to(eq(422))
      end
    end
  end
end
