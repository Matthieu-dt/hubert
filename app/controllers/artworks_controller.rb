class ArtworksController < ApplicationController
  def index
    @artworks = policy_scope(Artwork)
  end

  def new
    @category = Category.find(params[:category_id])
    @artwork = Artwork.new(category: @category)
    authorize @artwork
  end

  def create
    @category = Category.find(params[:category_id])
    @artwork = Artwork.new(artwork_params)
    @artwork.category = @category
    authorize @artwork
    if @artwork.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end

  def edit
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end

  def update
    @artwork = Artwork.find(params[:id])
    authorize @artwork
    @artwork.update(artwork_params)
    redirect_to category_artwork_path(@artwork)
  end

  def destroy
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :description, :category, :photo)
  end
end
