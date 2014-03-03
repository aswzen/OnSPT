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
		# AGUS = FactoryGirl.build(:user, nama_depan: "AGUS") 
		# jones = FactoryGirl.build(:user, nama_depan: "Jones") 
		# johnson = FactoryGirl.build(:user, nama_depan: "Johnson") 
		# User.pencarian("AGUS").should == AGUS 
	end

end 

