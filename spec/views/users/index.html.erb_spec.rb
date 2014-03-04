require 'spec_helper'

describe 'users/index.html.erb' do
  it 'menampilkan daftar karyawan dengan benar' do
   
    User.create!(id: 1, nama_depan: 'Sigit', nama_belakang: 'Wisnu', email: "hayo@coba.com")
    User.create(id: 2, nama_depan: 'Shano', nama_belakang: 'Hagemaru', email: "cobacoba@coba.com")
   	@users =  User.all

    render

    rendered.should contain('SIGIT')
    rendered.should contain('HAGEMARU')
  end

end
