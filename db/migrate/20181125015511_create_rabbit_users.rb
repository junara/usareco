class CreateRabbitUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :rabbit_users do |t|
      t.references :rabbit
      t.references :user
      t.timestamps
    end
  end
end
