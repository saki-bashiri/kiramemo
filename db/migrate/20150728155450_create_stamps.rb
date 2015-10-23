class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :name
      t.string :image, null: false
      t.string :description

      t.timestamps null: false
    end

    add_index :stamps, :name, {name: "stamp_name"}
  end
end
