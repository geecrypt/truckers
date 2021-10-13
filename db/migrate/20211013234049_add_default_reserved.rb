class AddDefaultReserved < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:trucks, :reserved, false)
  end
end
