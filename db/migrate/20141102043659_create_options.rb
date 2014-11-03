class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.float :total_price, default: 0
      t.float :total_oz, default: 0
      t.float :price_per_oz, default: 0
    end
  end
end
