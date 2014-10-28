class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :category
      t.float :volume
      t.string :volume_type
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
