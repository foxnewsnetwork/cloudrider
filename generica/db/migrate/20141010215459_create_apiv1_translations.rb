class CreateApiv1Translations < ActiveRecord::Migration
  def change
    create_table :apiv1_translations do |t|
      t.string :locale, null: false
      t.string :key, null: false
      t.string :translated_text
      t.timestamps
    end
    add_index :apiv1_translations, [:key, :locale], unique: true
  end
end
