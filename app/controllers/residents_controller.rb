class ResidentsController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @resident = Resident.all
  end

  def show
    @resident = Resident.find(params[:id])
  end

  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(resident_params)
    if @resident.save
      redirect_to @resident, notice: 'resident created'
    else
      render :new, status: 'unprocessable entity'
    end
  end

  def resident_params
    params.require(:resident).permit(:name, :age, :occupation)
  end
end
