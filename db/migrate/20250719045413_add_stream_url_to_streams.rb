class AddStreamUrlToStreams < ActiveRecord::Migration[8.0]
  def change
    add_column :streams, :stream_url, :text
  end
end
