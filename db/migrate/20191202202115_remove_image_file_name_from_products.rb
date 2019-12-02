class RemoveImageFileNameFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image_filename
    add_column :products, :image, :string
  end
end
