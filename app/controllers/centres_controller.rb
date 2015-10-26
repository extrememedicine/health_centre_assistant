class CentresController < ApplicationController
  def index
    @centres = Centre.all
  end

  def show
    @centre = Centre.find(params[:id])
  end

  def destroy
    @centre = Centre.find(params[:id])
    @centre.destroy

    redirect_to centres_path
  end

  def new
  end

  def edit
    @centre = Centre.find(params[:id])
  end

  def create
    @centre = Centre.new(centre_params)

    @centre.save
    redirect_to @centre
  end

  def update
    @centre = Centre.find(params[:id])

    if @centre.update(centre_params)
      redirect_to @centre
    else
      render 'edit'
    end
  end



  private
    def centre_params
      params.require(:centre).permit(:name, :location, :description, :status, :key_contacts, :assistant_contacts, :medical, :medical_level, :equiptment, :equiptment_level, :people, :people_level, :food, :food_level, :other)
    end

end
