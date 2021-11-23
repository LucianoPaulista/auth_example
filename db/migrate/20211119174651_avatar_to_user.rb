class AvatarToUser < ActiveRecord::Migration[6.1]
  def change
    add_column(:users, :avatar, :attachment)
  end
end
