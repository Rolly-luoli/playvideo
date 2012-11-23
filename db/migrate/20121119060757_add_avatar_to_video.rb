class AddAvatarToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :avatar, :string
  end
end
