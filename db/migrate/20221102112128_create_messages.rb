class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|

      t.integer :user_id
      t.integer :tag_id
      t.text :text

      t.timestamps
    end
  end
end
