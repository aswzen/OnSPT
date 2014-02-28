class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nama_depan
      t.string :nama_belakang
      t.string :jabatan
      t.string :email

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
