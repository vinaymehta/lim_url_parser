class CreateUrlContents < ActiveRecord::Migration
  def change
    create_table :url_contents do |t|
      t.string :url
      t.text :h1_content
      t.text :h2_content
      t.text :h3_content
      t.text :link_content
      t.timestamps null: false
    end
  end
end
