class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.date :dob
      t.date :doj
      t.string :passenger_name
      t.string :from
      t.string :to
      t.string :travel_class
      t.float :amount
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
