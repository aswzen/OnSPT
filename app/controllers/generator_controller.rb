class GeneratorController < ApplicationController
  before_action :set_generator, only: [:show, :edit, :update, :destroy]

  def index
  	 @sptalls = SptParticipants.all
  end

  def ubah

  end

  def genspt    
    @sptsall = SptParticipants.new
  	@judulform = "Tambah Surat"
  end

  def buatkan
    @sptssend = SptParticipants.new(sptpart_params)
    @sptalls = SptParticipants.all
    @info = 'Data surat sukses ditambahkan'
    respond_to do |format|
      if @sptssend.save
        format.html { render action: 'index' ,notice: 'Data surat sukses ditambahkan.' }
        #format.json { render action: 'index', status: :created, location: @user}
      else
        format.html { render action: 'index' }
        #@sptssend
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end 

  def surat
  	@sptall = SptParticipants.find_by_id(params[:id])
   respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "file_name",
        :template => 'layouts/surat.pdf.erb'
      end
    end
  end  

  def suratmulti
  	@sptall = SptParticipants.find_by_spt_id(params[:id])
  	@datamulti = SptParticipants.where(["spt_id = ?", params[:id]])
  	 
     respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "file_name",
        :template => 'layouts/suratmulti.pdf.erb', :page_height => '12in', :page_width => '8.5in'
      end
    end
  end

private


  def sptpart_params
     # params.fetch(:sptparticipants, {}).permit(:id, :user_id, :spt_id)
     params.require(:spt_participants).permit(:user_id, :spt_id)  if params[:spt_participants]
    
   end
end
