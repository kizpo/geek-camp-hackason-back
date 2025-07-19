class AddDescriptionToStreams < ActiveRecord::Migration[8.0]
  def change
    add_column :streams, :description, :text
  end
end
