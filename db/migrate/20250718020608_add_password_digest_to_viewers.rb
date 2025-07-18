class AddPasswordDigestToViewers < ActiveRecord::Migration[8.0]
  def change
    add_column :viewers, :password_digest, :string
  end
end
