class CreateDonationTargets < ActiveRecord::Migration[8.0]
  def change
    create_table :donation_targets do |t|
      t.string :name, null: false
      t.string :website_url
      t.text :bank_account_info
      t.string :contact_email

      t.timestamps
    end
  end
end
