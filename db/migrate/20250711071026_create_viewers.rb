class CreateViewers < ActiveRecord::Migration[8.0]
  def change
    create_table :viewers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.index :email, unique: true
      t.string :password, null: false


      t.timestamps
    end
  end
end
