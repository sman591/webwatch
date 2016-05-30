class FixUuidAssociation < ActiveRecord::Migration[5.0]
  def change
    Screenshot.destroy_all
    remove_column :screenshots, :website_id, :integer
    add_column :screenshots, :website_id, :uuid
    add_index :screenshots, :website_id
  end
end
