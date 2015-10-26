class CentresController < ApplicationController
  def index
  end

  def new
  end

  def create
    @centre = Centre.new(centre_params)

    @centre.save
    redirect_to @centre
  end



  private
    def centre_params
      params.require(:centre).permit(:name, :location, :description, :status, :key_contacts, :assistant_contacts, :medical, :medical_level, :equiptment, :equiptment_level, :people, :people_level, :food, :food_level, :other)
    end

end
