# typed: strict
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
class TimeLog < ApplicationRecord
  validate :ended_at_after_started_at

  belongs_to :project
  belongs_to :user

  private

  sig { void }
  def ended_at_after_started_at
    return if ended_at.blank? || started_at.blank?

    if T.must(ended_at) < started_at
      errors.add(:ended_at, "cannot be before the start time")
    end
  end
end
