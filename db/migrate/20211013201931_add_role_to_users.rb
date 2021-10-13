class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :role, default: 'driver', null: false
    end
  end
end
