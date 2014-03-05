class GeneratorController < ApplicationController
  before_action :set_generator, only: [:show, :edit, :update, :destroy]

  def index
  	 @sptall = SptParticipants.all
  end

  def genspt
  	@judulform = "Tambah Surat"
  end

  def show
  end 




  def surat
  	@sptall = SptParticipants.find_by_id(params[:id])
  	#@surate = SptParticipants.find(params[:id])
  end  

  def suratmulti
  	@sptall = SptParticipants.find_by_spt_id(params[:id])
  	@datamulti = SptParticipants.where(["spt_id = ?", params[:id]])
  	#@surate = SptParticipants.find(params[:id])
  end

private
 def set_user
    	@sptall = SptParticipants.find_by_id(1)
 end

  def sptpart_params
      params.require(:sptparticipants).permit(:id, :user_id, :spt_id)
   end
end
