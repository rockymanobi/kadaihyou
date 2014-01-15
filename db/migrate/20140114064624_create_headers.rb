class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.references :issue_list
      t.string :key
      t.string :name

      t.timestamps
    end
    add_index :headers, :issue_list_id
  end
end
