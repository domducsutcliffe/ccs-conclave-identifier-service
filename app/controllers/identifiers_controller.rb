class IdentifiersController < ApplicationController
  before_action :set_identifier, only: %i[ show edit update destroy ]

  # GET /identifiers or /identifiers.json
  def index
    @identifiers = Identifier.all
  end

  # GET /identifiers/new
  def new
    @identifier = Identifier.new
  end

  # POST /identifiers or /identifiers.json
  def create
    @identifier = Identifier.new(identifier_params)

    respond_to do |format|
      if @identifier.save
        format.html { redirect_to identifier_url(@identifier), notice: "Identifier was successfully created." }
        format.json { render :show, status: :created, location: @identifier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @identifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /identifiers/1 or /identifiers/1.json
  def update
    respond_to do |format|
      if @identifier.update(identifier_params)
        format.html { redirect_to identifier_url(@identifier), notice: "Identifier was successfully updated." }
        format.json { render :show, status: :ok, location: @identifier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @identifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /identifiers/1 or /identifiers/1.json
  def destroy
    @identifier.destroy

    respond_to do |format|
      format.html { redirect_to identifiers_url, notice: "Identifier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_identifier
      @identifier = Identifier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def identifier_params
      params.require(:identifier).permit(:ccs_id, :id_type, :ccs_persisted)
    end
end
