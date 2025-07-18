class CreateStreams < ActiveRecord::Migration[8.0]
  def change
    create_table :streams do |t|
      t.string :title
      t.string :status
      t.references :streamer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
