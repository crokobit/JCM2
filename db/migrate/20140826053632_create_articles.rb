class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.datetime :pubDate
      t.string :title

      t.timestamps
    end
  end
end
