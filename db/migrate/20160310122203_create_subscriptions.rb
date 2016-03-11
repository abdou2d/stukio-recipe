class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.string  :name
      t.decimal :price
      t.string  :subs_id
      t.timestamps null: false
    end
  end
end


