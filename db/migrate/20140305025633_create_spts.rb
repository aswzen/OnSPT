class CreateSpts < ActiveRecord::Migration
  def change
    create_table :spts do |t|
      t.string :tempat_tujuan
      t.string :durasi_waktu
      t.string :jenis_transportasi
      t.text :maksud_tugas

      t.timestamps
    end
  end
end
