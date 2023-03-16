class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :owner, foreign_key: {to_table: 'users'},  null: false
      t.references :guest, foreign_key: {to_table: 'users'},  null: true
      t.decimal :total, precision: 15, scale: 2
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
