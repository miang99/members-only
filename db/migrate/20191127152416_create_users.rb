class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.strigit ng :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
