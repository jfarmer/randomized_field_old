class CreatePrefixModels < ActiveRecord::Migration
  def change
    create_table :prefix_models do |t|
      t.string :dummy_field

      t.timestamps
    end
  end
end
