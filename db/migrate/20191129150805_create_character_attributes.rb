class CreateCharacterAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :character_attributes do |t|
      t.references :character_type, null: false, foreign_key: true
      t.string :name
      t.integer :value

      t.timestamps
    end

    add_index :character_attributes, [:character_type_id, :name], unique: true
  end
end
