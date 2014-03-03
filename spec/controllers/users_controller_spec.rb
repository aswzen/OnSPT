require 'spec_helper' 

describe UsersController do 
	describe "GET #index" do 
		it "Mempopulasi daftar karyawan" do
			#user = FactoryGirl.create(:user)
			#	pp user
			#pp :user
			#pp get :index
			#assigns(:user).should eq([user])
		end
		it "Melakukan render view :index" do
			get :index
			response.should render_template :index
		end
	end 

	describe "GET #show" do 
		it "assigns the requested contact to @contact" do
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
		 it "assigns a home, office, and mobile phone to the new contact" do 
		 	# get :new 
		 	# assigns(:user).jabatan.map{ |p| p.jabatan }.should eq %w(Karyawan Staf Manajer)
	 	end 

		it "assigns a new Contact to @contact" do
		end

		it "Melakukan render view :new" do
			get :new
			response.should render_template :new
		end
	end 
	
	describe "POST #create" do 
		context "with valid attributes" do 
			it "saves the new contact in the database" 
			
			it "redirects to the home page" do
				get :index
				response.should render_template :index
			end
		end 

		context "with invalid attributes" do
			it "does not save the new contact in the database" 
			
		end
	end

	# describe 'DELETE destroy'do 
	# 	before :each do
	# 	 @contact = Factory(:contact) 
	# 	end 
	# 	it "deletes the contact" do 
	# 		expect{ 
	# 			delete :destroy, id: @contact 
	# 			}.to change(Contact,:count).by(-1) 
	# 	end 
	# 	it "redirects to contacts#index" do 
	# 		delete :destroy, id: @contact r
	# 		esponse.should redirect_to contacts_url 
	# 	end 

	# end 

end 
