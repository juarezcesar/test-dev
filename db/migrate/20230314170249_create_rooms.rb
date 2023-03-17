class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.decimal :price, precision: 15, scale: 2, null: false, default: 0
      t.datetime :check_in_time, null: false
      t.references :owner, foreign_key: {to_table: 'users'},  null: false
      t.references :guest, foreign_key: {to_table: 'users'},  null: true

      t.timestamps
    end
  end
end
