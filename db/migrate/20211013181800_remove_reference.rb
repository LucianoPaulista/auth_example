class RemoveReference < ActiveRecord::Migration[6.1]
  def change
    remove_reference(:users, :company_id)
    remove_column(:users, :id_company, if_exists: true)
  end
end
