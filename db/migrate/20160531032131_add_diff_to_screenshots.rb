class AddDiffToScreenshots < ActiveRecord::Migration[5.0]
  def self.up
    change_table :screenshots do |t|
      t.attachment :diff_image
      t.decimal    :diff_percent, precision: 7, scale: 5
      t.datetime   :diff_date
    end

    change_table :websites do |t|
      t.decimal    :diff_threshold, precision: 7, scale: 5, default: 5
    end
  end

  def self.down
    remove_attachment :screenshots, :diff_image
    remove_column     :screenshots, :diff_percent
    remove_column     :screenshots, :diff_date
    remove_column     :websites,    :diff_threshold
  end
end
