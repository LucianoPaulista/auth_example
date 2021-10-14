class AddFieldnameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :id_company, :integer
  end
end
