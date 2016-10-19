class ResturantsController < ApplicationController
  before_action :admin_user,     only: [:new,:destroy]
def index
  @resturant = Resturant.new
  @resturants = Resturant.all
@users = User.all
@products = Product.new
  if params[:search]
    @resturants = Resturant.search(params[:search]).order("created_at DESC")
  else
    @resturants = Resturant.order("created_at DESC")
  end
end


def show
    @resturant = Resturant.find(params[:id])
    @resturants = Resturant.all
    @products = @resturant.products.all
    @order_item = current_order.order_items.new

  end

  def new
@resturant = Resturant.new
@resturants = Resturant.all
@products = Product.new
  end

  def create
 @resturant = current_user.resturants.build(resturant_params)
    if @resturant.save
      flash[:success] = "Resturant Saved!"
      redirect_to @resturant
    else
      render 'new'
    end
  end

  def edit
     @resturant = Resturant.find_by(params[:resturant_id])
   end

 def update
     @resturant = Resturant.find_by(params[:resturant_id])
     if @resturant.update_attributes(resturant_params)
       flash[:success] = "Restaurant updated"
       redirect_to @resturant
     else
       render 'edit'
     end
   end

   def destroy
    Resturant.find_by(params[:id]).destroy
    flash[:success] = "Resturant deleted"
    redirect_to resturants_url
   end

  def search
  @resturants = Resturant.search params[:search]
end
private

def resturant_params
      params.require(:resturant).permit( :name, :owner_name, :image, :owner_id)
    end

def admin_user
  redirect_to(root_url) unless current_user.admin?
    end

end
