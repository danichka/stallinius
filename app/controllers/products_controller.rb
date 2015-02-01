class ProductsController < ApplicationController

  def index
    @products = Product.search(params)
    @products = Product.all
  end

  def show
    @product = Product.find (params[:id])
    @images = @product.images
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render "new"
    end
    
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
    end
  end


  private
  
  def product_params
    params.require(:product).permit(:name, :specification, :price, :image_id, :remote_image_url, images_attributes: [:image] )
  end




end