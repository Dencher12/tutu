class AddNameAndPassportToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :passport, :string
    add_column :tickets, :full_name, :string
  end
end
