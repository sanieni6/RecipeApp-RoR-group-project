class ChangeMeasurementUnitToStringInFoods < ActiveRecord::Migration[7.0]
  def up
    change_column :foods, :measurement_unit, :string
  end

  def down
    change_column :foods, :measurement_unit, :integer
  end
end
