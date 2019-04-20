class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.text :source
      t.text :title
      t.text :description
      t.text :url
      t.text :image
      t.text :content

      t.timestamps
    end
  end
end
