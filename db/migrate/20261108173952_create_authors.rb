class CreateAuthors < ActiveRecord::Migration[8.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :country
      t.text :biography

      t.timestamps
    end
  end
end
