class CreateScreenshots < ActiveRecord::Migration[5.0]
  def change
    create_table :screenshots, id: :uuid do |t|
      t.belongs_to :website, index: true

      t.timestamps
    end
  end
end
