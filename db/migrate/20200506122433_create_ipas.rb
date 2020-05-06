class CreateIpas < ActiveRecord::Migration[6.0]
  def change
    create_table :ipas do |t|
      t.string :name
      t.string :brand
      t.integer :size
      
      t.timestamps
    end
  end
end
