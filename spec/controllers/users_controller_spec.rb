require 'spec_helper' 

describe UsersController do 
	describe "GET #index" do 
		it "Mempopulasi daftar karyawan" do
			user = FactoryGirl.create(:user)
			get :index
			assigns(:users).should eq([user])
		end
		
		it "Status : 200" do
	      	get :index
	      	expect(response.status).to eq(200)
	    end

	    #ROUTING
		it "Melakukan render view :index" do
			get :index
			response.should render_template :index
		end
	end 

	describe "GET #show" do 
		it "Melakukan permintaan kontak ke @contact" do
			user = FactoryGirl.create(:user)
			get :show, id: user
			assigns(:user).should eq(user)
		end
		it "Melakukan render view :show" do
			get :show, id: FactoryGirl.create(:user)
			response.should render_template :show
		end
	end 

	describe "GET #new" do 
		 it "Salah satu jabatan digunakan" do 
		 	 get :new 
		 	 user = FactoryGirl.create(:user)
		 	# pp assigns(:user).jabatan{ |p| p.jabatan }
		 	#pp [1,2,3].map(&:to_s)
		 	#pp user.map(&:to_s)
		 	#pp user.jabatan
		 	#pp assigns(:user).all
		 	## pp  user.map { |phone| phone.jabatan }
		 	 #pp assigns(:user).jabatan{ |p| p.jabatan }.should eq %w(Karyawan Staf Manajer)
		 	# assigns(:user).jabatan.map{ |p| p.jabatan }.should eq %w(Karyawan Staf Manajer)
	 	end 

		it "Melakukan render view :new" do
			get :new
			response.should render_template :new
		end
	end 
	
	describe "POST #create" do 
		context "dengan attribut yang benar" do 
			it "sukses membuat kontak baru" do
				expect{ 
					post :create, 
					user: FactoryGirl.attributes_for(:user) 
					}.to change(User,:count).by(1) 
			end 

			it "merender view :show" do
				get :show, id: FactoryGirl.create(:user)
				response.should render_template :show
			end
		end 

		context "dengan attribut yang salah" do
			it "tidak menyimpan data kedalam database" do
				expect{ 
					post :create, 
					user: FactoryGirl.attributes_for(:invalid_user) }.to_not change(User,:count) 
			end

			it "merender ulang view :new" do
				 post :create, 
				 user: FactoryGirl.attributes_for(:invalid_user) 
				 response.should render_template :new
			end
			
		end
	end

	describe 'Proses Update' do
		before :each do
			 @user = FactoryGirl.create(:user, nama_depan: "Lawrence", nama_belakang: "Smith", jabatan: "Karyawan", email: "email@saya.com") 
		end

		context "dengan attribut yang valid" do 
			it "sukses memilih karyawan yang akan diupdate" do 
				put :update, id: @user, user: FactoryGirl.attributes_for(:user) 
				assigns(:user).should eq(@user) 
			end

			it "update data karyawan (nama depan dan belakang huruf besar)" do
				put :update, id: @user, user: FactoryGirl.attributes_for(:user, nama_depan: "NamaDepan", nama_belakang: "NamaBelakang", jabatan: "Karyawan", email: "email@baru.com") 
				@user.reload 
				@user.nama_depan.should eq("NAMADEPAN")
				@user.nama_belakang.should eq("NAMABELAKANG") 
				@user.jabatan.should eq("Karyawan") 
				@user.email.should eq("email@baru.com") 
			end 

			it "redirects ke halaman show (sudah diupdate)" do 
				put :update, id: @user, user: FactoryGirl.attributes_for(:user) 
				response.should redirect_to @user 
			end 
		end

		context "dengan atribut yang tidak valid" do 
			it "memilih karyawan yang akan diupdate" do 
				put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user) 
				assigns(:user).should eq(@user) 
			end

			it "gagal update karyawan jika isian salah" do 
				put :update, id: @user, user: FactoryGirl.attributes_for(:user, nama_depan: "Larry", nama_belakang: nil) 
				@user.reload 
				@user.nama_depan.should_not eq("LARRY") 
				@user.nama_belakang.should eq("SMITH") 
			end 

			it "merender ulang method edit" do
				put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user) 
				response.should render_template :edit 
			end 

		end
	end


	describe 'proses delete' do 
		before :each do
		 @user = FactoryGirl.create(:user) 
		end 
		it "kontak" do 
			expect{ 
				delete :destroy, id: @user 
				}.to change(User,:count).by(-1) 
		end 
		it "redirect ke user#index" do 
			delete :destroy, id: @user 
			response.should redirect_to users_url 
		end 

	end 

end 
