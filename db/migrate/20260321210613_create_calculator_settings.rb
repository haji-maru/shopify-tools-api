class CreateCalculatorSettings < ActiveRecord::Migration[7.2]
  def change
    create_table :calculator_settings do |t|
      t.string :cost
      t.string :margin
      t.string :fee_rate
      t.string :rounding_method

      t.timestamps
    end
  end
end
