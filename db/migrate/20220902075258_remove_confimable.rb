class RemoveConfimable < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :confirmation_token, :confirmed_at
    remove_column :users, :confirmation_sent_at, :unconfirmed_email
  end
end
