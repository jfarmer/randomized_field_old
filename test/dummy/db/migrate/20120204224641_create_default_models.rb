class CreateDefaultModels < ActiveRecord::Migration
  def change
    create_table :default_models do |t|
      t.string :dummy_field

      t.timestamps
    end
  end
end
