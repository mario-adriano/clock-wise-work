# typed: false
# frozen_string_literal: true

# == Schema Information
#
# Table name: project_users
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_project_users_on_project_id  (project_id)
#  index_project_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe(ProjectUser, type: :model) do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end
end
