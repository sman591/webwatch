class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites, id: :uuid do |t|
      t.string :url

      t.timestamps
    end
  end
end
