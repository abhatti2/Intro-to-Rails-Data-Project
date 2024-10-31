class AddHierarchyAttributesToBreeds < ActiveRecord::Migration[7.2]
  def change
    add_column :breeds, :group, :string
    add_column :breeds, :size, :string
    add_column :breeds, :purpose, :string
  end
end
