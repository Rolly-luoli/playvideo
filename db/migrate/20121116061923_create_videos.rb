class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :videocontent
      t.timestamps
    end
  end
end
