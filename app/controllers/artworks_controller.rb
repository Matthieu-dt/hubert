class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def new
    @category = Category.find(params[:category_id])
    @artwork = Artwork.new(category: @category)
  end

  def create
    @category = Category.find(params[:category_id])
    @artwork = Artwork.new(artwork_params)
    @artwork.category = @category
    if @artwork.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(artwork_params)
    redirect_to category_artwork_path(@artwork)
  end

  def destroy
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :description, :price, :category)
  end
end
