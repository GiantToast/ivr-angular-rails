class CreateMessagePlays < ActiveRecord::Migration
  def change
    create_table :message_plays do |t|
    	t.column :phonenumber, :string
    	t.column :message_id, :integer
    	t.timestamps
    end
  end
end
