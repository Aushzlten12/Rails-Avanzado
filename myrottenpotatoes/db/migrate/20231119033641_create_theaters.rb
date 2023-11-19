class CreateTheaters < ActiveRecord::Migration[7.0]
  def change
    create_table :theaters do |t|
      t.string :name
      t.datetime 'date_movie'
      t.timestamps
    end
  end
end
