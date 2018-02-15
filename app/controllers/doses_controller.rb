class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)

    respond_to do |format|
      if @dose.save
        format.html { redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully created.' }
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    @cocktail = @dose.cocktail
    respond_to do |format|
      format.html { redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
    # Never trust parameters from the scary internet, only allow the white list through.
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end

