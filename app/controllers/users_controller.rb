class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  #def show
  #end

  def new
    @user = User.new
    @judulform = 'Karyawan Baru' 
     
      %w(Karyawan Staf Manajer).each do |jabatans| 
        # pp jabatans
        # pp @user.jabatan
        @user.jabatan = jabatans
      end 
  end

  def edit
    @judulform = 'Ubah detail karyawan'
  end


  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Data karyawan sukses ditambahkan.' }
        #format.json { render action: 'show', status: :created, location: @user}
      else
        format.html { render action: 'new' }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Data karyawan sukses diubah.' }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    @id = @user.id

    #buat redirect langsung
    redirect_to @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nama_depan, :nama_belakang, :jabatan, :email)
    end
end
