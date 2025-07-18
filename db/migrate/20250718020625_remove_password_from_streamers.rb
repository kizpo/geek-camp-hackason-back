class RemovePasswordFromStreamers < ActiveRecord::Migration[8.0]
  def change
    remove_column :streamers, :password, :string
  end
end
