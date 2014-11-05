class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.float :volume
      t.string :volume_type
      t.float :price
      t.integer :quantity
      t.float :abv
      t.float :oz_of_alc
      t.float :price_per_oz
      t.belongs_to :option

      t.timestamps
    end
  end
end
