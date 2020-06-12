class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.boolean :public
      t.boolean :active, default: true
      t.string :title
      t.text :description
      t.string :location
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
