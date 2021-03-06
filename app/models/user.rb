class User < ActiveRecord::Base
	has_many :spt_participants
	before_save { self.email = email.downcase }
	before_save { self.nama_depan = nama_depan.upcase }
	before_save { self.nama_belakang = nama_belakang.upcase }
	validates_presence_of :nama_depan, :message => "tidak boleh kosong"
	validates_presence_of :nama_belakang, :message => "tidak boleh kosong"
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_presence_of :email, presence: true, message: "tidak boleh kosong"
	validates_format_of :email, :with=>VALID_EMAIL_REGEX, :message=>"harus sesuai format"
	validates_uniqueness_of :email, :message=>"sudah digunakan orang lain"
	
	def self.pencarian(letter) 
		tes = User.where("nama_depan LIKE ?", "%#{letter}%").select(:nama_depan).first
		# pp letter + 'letter'
		return tes
	end 
end
