class ProductsController < ApplicationController

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    end

    def new
  @product = Product.new()

    end

    def onew
  @product = Product.new()
  @resturant = Resturant.find_by(params[:id])

    end

    def create
   @product = Product.new(product_params)
    	if @product.save
    		flash[:success] = "Product Created!"
    		redirect_to @product
    	else
    		render 'new'
    	end
    end

  private

  def product_params
        params.require(:product).permit(:name, :price, :resturant_id, :image)
      end


end
