class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :status
      t.string :bug_type
      t.string :deadline
      t.string :screenshot
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
