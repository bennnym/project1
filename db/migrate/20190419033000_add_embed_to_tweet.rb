class AddEmbedToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :embed, :text
  end
end
