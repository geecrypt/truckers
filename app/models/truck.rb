class Truck < ApplicationRecord
  self.inheritance_column = 'type_column_name'
  belongs_to :company
end
