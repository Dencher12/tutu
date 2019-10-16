class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :first_station
      t.string :last_station
      t.belongs_to :user
      t.belongs_to :train

      t.timestamps
    end
  end
end
