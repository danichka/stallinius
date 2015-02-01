class ImagesController < ApplicationController

  def index
    @image = @product.image
  end

  def new
    @image = @product.image.new
  end


  private
  
  def image_params
    params.require(:image).permit(:image, :product_id, )
  end
end