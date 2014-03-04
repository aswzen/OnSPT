# spec/models/user.rb 

require 'spec_helper' 

describe User do 

	it "punya model yang valid" do
		FactoryGirl.create(:user).should be_valid
	end

	it "harus mempunyai nama depan" do
		FactoryGirl.build(:user, nama_depan: nil).should_not be_valid 
	end

	it "harus mempunyai nama belakang" do
		FactoryGirl.build(:user, nama_belakang: nil).should_not be_valid 
	end

	it "harus mempunyai email" do
		FactoryGirl.build(:user, email: nil).should_not be_valid 
	end

	it "fungsi pencarian harus berjalan dengan baik" do 
		AGUS =  FactoryGirl.create(:user, nama_depan: "ANDI")
		#pp AGUS.nama_depan.should == User.by_letter('AGUS').nama_depan
		tes = User.pencarian('ANDI')
			if tes == nil
		 	 	tes.should_not be_nil
		  	else
		  		expect(tes.nama_depan).to eq(AGUS.nama_depan)
			end
	end 
end 

