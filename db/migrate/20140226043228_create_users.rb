class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nama_depan, :null => false
      t.string :nama_belakang, :null => false
      t.string :jabatan
      t.string :email, :null => false

      t.timestamps
    end
  end
end
