class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new(dose_params)
   @dose.cocktail = @cocktail
   if @dose.save
     redirect_to cocktail_path(@cocktail)
   else
     render :new
   end
 end

 def destroy
   @dose.destroy
   redirect_to cocktails_path
 end

 private

 def dose_params
   params.require(:dose).permit(:ingredient_id, :description)
 end

 def set_dose
   @dose = Dose.find(params[:id])
 end
end
