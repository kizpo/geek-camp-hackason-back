class AddDonationTargetIdToStreamer < ActiveRecord::Migration[8.0]
  def change
    add_column :streamers, :donation_target_id, :bigint
    add_foreign_key :streamers, :donation_targets
    add_index :streamers, :donation_target_id
  end
end
