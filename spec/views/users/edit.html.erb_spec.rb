require 'spec_helper'

describe 'users/edit.html.erb' do


  it 'menampilkan detail karyawan yang akan diedit dengan benar' do
    assign(:user, User.create(id: 1, nama_depan: 'Sigit', nama_belakang: 'Wisnu', email: 'sigit@keren.com', jabatan: 'Karyawan'))
  	
	render
	
	selector = css_select("#user_nama_depan").first
	selector["value"].should == "SIGIT"

  end

end
