class CreateTimeLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :time_logs, id: :uuid do |t|
      t.references :project, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
