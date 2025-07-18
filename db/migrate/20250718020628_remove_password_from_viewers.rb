class RemovePasswordFromViewers < ActiveRecord::Migration[8.0]
  def change
    remove_column :viewers, :password, :string
  end
end
