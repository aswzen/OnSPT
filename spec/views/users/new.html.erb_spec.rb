require 'spec_helper'

describe 'users/new.html.erb' do


  it 'menampilkan form karyawan baru dengan benar' do
    assign(:user, User.new)
  	
	render
	
	rendered.should contain("Nama depan")
	rendered.should contain("Nama belakang")
	rendered.should contain("Jabatan")
	rendered.should contain("Email")

  end

end
