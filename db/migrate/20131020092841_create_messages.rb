class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.column :message, :text
    	t.column :active, :boolean
    	t.column :user_id, :integer
    	t.timestamps
    end
  end
end
