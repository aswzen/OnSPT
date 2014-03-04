require 'spec_helper'

describe 'users/show.html.erb' do
  it 'menampilkan detail karyawan dengan benar' do
    assign(:user, User.create(id: 1, nama_depan: 'Sigit', nama_belakang: 'Wisnu'))
    render

    rendered.should contain('Sigit')
    rendered.should contain('Wisnu')
  end

end
