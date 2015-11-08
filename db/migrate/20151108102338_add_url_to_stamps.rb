class AddUrlToStamps < ActiveRecord::Migration
  def up
    add_column :stamps, :url, :string, after: :image
    change_column :stamps, :image, :string, null: true
  end

  def down
  end
end
