class CreateTwilio < ActiveRecord::Migration
  def change
    create_table :twilios do |t|
    	t.string :from 
    	t.string :to 
    	t.string :body 

    	t.timestamps
    end
  end
end
