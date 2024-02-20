class CreateMeasurements < ActiveRecord::Migration[7.1]
  def change
    create_table :measurements do |t|
      t.string :unit_measurement

      t.timestamps
    end
  end
end
