class ChangeDatatypeOnTableFromStringToText < ActiveRecord::Migration
  def change
    change_column :posts, :post_content, :text, :limit => nil
  end
end
