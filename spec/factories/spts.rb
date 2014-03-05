# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spt do
    tempat_tujuan "MyString"
    durasi_waktu "MyString"
    jenis_transportasi "MyString"
    maksud_tugas "MyText"
  end
end
