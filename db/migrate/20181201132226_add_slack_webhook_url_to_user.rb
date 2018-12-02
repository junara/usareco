class AddSlackWebhookUrlToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :rabbits, :token, :string
    add_column :rabbits, :slack_webhook_url, :string
    remove_column :rabbits, :family_id, :bigint
  end
end
