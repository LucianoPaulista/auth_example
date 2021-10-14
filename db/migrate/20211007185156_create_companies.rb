class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
