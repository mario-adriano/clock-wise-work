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
FactoryBot.define do
  factory :time_log do
    project { create(:project) }
    user { create(:new_user) }
    started_at { "2023-09-25 01:02:55" }
    ended_at { "2023-09-25 04:02:55" }
  end
end
