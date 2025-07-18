class AddPasswordDigestToStreamers < ActiveRecord::Migration[8.0]
  def change
    add_column :streamers, :password_digest, :string
  end
end
