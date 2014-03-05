class SptsController < ApplicationController
  before_action :set_spt, only: [:show, :edit, :update, :destroy]

  # GET /spts
  # GET /spts.json
  def index
    @spts = Spt.all
  end

  # GET /spts/1
  # GET /spts/1.json
  def show
  end

  # GET /spts/new
  def new
    @spt = Spt.new
    @judulform = 'Tambah Tugas' 
  end

  # GET /spts/1/edit
  def edit
    @judulform = 'Ubah Detail Tugas' 
  end

  # POST /spts
  # POST /spts.json
  def create
    @spt = Spt.new(spt_params)

    respond_to do |format|
      if @spt.save
        format.html { redirect_to @spt, notice: 'Spt was successfully created.' }
        format.json { render action: 'show', status: :created, location: @spt }
      else
        format.html { render action: 'new' }
        format.json { render json: @spt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spts/1
  # PATCH/PUT /spts/1.json
  def update
    respond_to do |format|
      if @spt.update(spt_params)
        format.html { redirect_to @spt, notice: 'Spt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @spt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spts/1
  # DELETE /spts/1.json
  def destroy
    @spt.destroy
    respond_to do |format|
      format.html { redirect_to spts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spt
      @spt = Spt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spt_params
      params.require(:spt).permit(:tempat_tujuan, :durasi_waktu, :jenis_transportasi, :maksud_tugas)
    end
end
