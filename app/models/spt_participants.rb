class SptParticipants < ActiveRecord::Base
	 belongs_to :user
	 belongs_to :spt

	 validates_presence_of :user_id, :message => "Karyawan tidak boleh kosong"
	 validates_presence_of :spt_id, :message => "Tugas tidak boleh kosong"

end
