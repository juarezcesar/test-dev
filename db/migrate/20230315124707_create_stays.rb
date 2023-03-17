class CreateStays < ActiveRecord::Migration[7.0]
  def change
    create_table :stays do |t|
      t.references :room, null: false, foreign_key: true
      t.references :guest, foreign_key: {to_table: 'users'},  null: true
      t.datetime :check_in_time, null: false
      t.datetime :check_out_time, null: false
      t.decimal :total, precision: 15, scale: 2, null: false, default: 0
      t.references :invoice, null: true, foreign_key: true

      t.timestamps
    end
  end
end
