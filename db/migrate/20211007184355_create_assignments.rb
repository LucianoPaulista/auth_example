class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.references :user, foreign_key: true, type: :integer
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
