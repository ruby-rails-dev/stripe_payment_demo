class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.string :full_name
      t.string :company
      t.string :stripe_customer_token
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
