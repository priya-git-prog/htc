class AddColumnToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :agent_charge, :float
    add_column :tickets, :cgst, :float
    add_column :tickets, :sgst, :float
    rename_column :tickets, :amount, :ticket_amount
  end
end
