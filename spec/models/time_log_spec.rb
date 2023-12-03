# typed: false
# frozen_string_literal: true

# == Schema Information
#
# Table name: time_logs
#
#  id         :uuid             not null, primary key
#  ended_at   :datetime
#  started_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_time_logs_on_project_id  (project_id)
#  index_time_logs_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe(TimeLog, type: :model) do
  it { should belong_to(:user) }
  it { should belong_to(:project) }

  describe "validations" do
    subject { build(:time_log) }

    context "when ended_at is before started_at" do
      before do
        subject.started_at = Time.now
        subject.ended_at = 1.day.ago
      end

      it "is not valid" do
        expect(subject).not_to(be_valid)
        expect(subject.errors[:ended_at]).to(include("cannot be before the start time"))
      end
    end

    context "when ended_at is after started_at" do
      before do
        subject.started_at = 1.day.ago
        subject.ended_at = Time.now
      end

      it "is valid" do
        expect(subject).to(be_valid)
      end
    end
  end
end
