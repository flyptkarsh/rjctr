class CreateBestof < ActiveRecord::Migration
  def change
    create_table :bestofs do |t|
    	t.text :comment
    	t.text :image_url
    	t.belongs_to :user 
    	t.timestamps  
    end
  end
end
