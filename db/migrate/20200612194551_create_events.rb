class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.boolean :public, default: true 
      t.boolean :active, default: true
      t.string :title
      t.text :description
      t.boolean :virtual, default: false
      t.string :location_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
