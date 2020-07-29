class CreateComplaints < ActiveRecord::Migration[6.0]
  def change
    create_table :complaints do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :result
      t.integer :status, default: 0
      t.point :location_point
      t.references :user, foreign_key: { on_delete: :nullify }
      t.timestamps null: false
    end
  end
end
