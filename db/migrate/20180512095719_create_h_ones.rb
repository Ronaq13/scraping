class CreateHOnes < ActiveRecord::Migration[5.1]
  def change
    create_table :h_ones do |t|
      t.string :content
      t.references :url, foreign_key: true

      t.timestamps
    end
  end
end
