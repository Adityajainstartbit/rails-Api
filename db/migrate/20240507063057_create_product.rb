class CreateProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.boolean :status ,default: false
      t.string :description
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
