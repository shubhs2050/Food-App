class OwnersController < ApplicationController
  def index
    @owners = Owner.all
    @resturant = Resturant.find_by(params[:resturant_id])
  end

  def new
    @owner = Owner.new
  end

  def create
   @owner = Owner.new(owner_params)
   if @owner.save
     MessMailer.info_owner(@owner).deliver_now
     flash[:success] = "Owner is Saved and an confirmation mail has been sent to owner's id !!!!!!!"
     redirect_to @owner
   else
     render 'new'
   end
 end

def show
@owner = Owner.find(params[:id])
@resturant = Resturant.find_by(params[:resturant_id])
@owners = Owner.all
@resturants = @owner.resturants.all
end


  private

    def owner_params
      params.require(:owner).permit(:name, :email)
    end

end
