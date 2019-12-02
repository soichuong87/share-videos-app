class AddVideosModel < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.belongs_to :user
      t.string    :title
      t.text      :description
      t.string    :uid
      t.string    :link
      t.timestamps
    end
  end
end
