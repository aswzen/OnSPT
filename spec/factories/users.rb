# spec/factories/users.rb 
require 'faker'

FactoryGirl.define do 
	factory :user do |f| 
	f.nama_depan { Faker::Name.first_name }
	f.nama_belakang { Faker::Name.last_name } 
	f.jabatan  { ["Karyawan", "Staf", "Manajer"].sample }
	f.email 'masripo@kaskus.kusam' 
	end 

	factory :invalid_user, parent: :user do |f| 
		f.nama_depan nil 
		f.nama_belakang nil 
	end 
end 