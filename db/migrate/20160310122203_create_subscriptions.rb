class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string  :name
      t.decimal :price
      t.string  :subs_id
      t.timestamps null: false
    end
  end
end