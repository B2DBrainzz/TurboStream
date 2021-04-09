class CreatePublicRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :public_rooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
