class AddAmountSubs < ActiveRecord::Migration
  def change
  	add_column :subscriptions , :amount, :decimal
  end
end
