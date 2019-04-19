class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :tweet
      t.integer :favorite
      t.string :language
      t.integer :retweet_count
      t.text :url

      t.timestamps
    end
  end
end
