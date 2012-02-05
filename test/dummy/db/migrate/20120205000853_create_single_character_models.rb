class CreateSingleCharacterModels < ActiveRecord::Migration
  def change
    create_table :single_character_models do |t|
      t.string :dummy_field

      t.timestamps
    end
  end
end
