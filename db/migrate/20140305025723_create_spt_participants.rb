class CreateSptParticipants < ActiveRecord::Migration
  def change
    create_table :spt_participants do |t|
      t.integer :spt_id
      t.integer :user_id

      t.timestamps
    end
  end
end
