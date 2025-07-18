class CreateStreamers < ActiveRecord::Migration[8.0]
  def change
    create_table :streamers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.index :email, unique: true
      t.string :password, null: false
      t.string :youtube_url
      t.string :twitch_url
      t.integer :donation_share_ratio, null: false

      t.timestamps
    end
  end
end
