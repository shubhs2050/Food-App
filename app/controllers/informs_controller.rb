class InformsController < ApplicationController


  def new
    @inform = Inform.new()
  end

def create
  @inform = Inform.new(inform_params)
    if @inform.save
      NoticeMailer.new_owner(@inform).deliver_now
      flash[:success] = "Your details has been sent to admin"
      redirect_to root_path
    else
      render "new"
    end
end


def show
  @inform =  Inform.find(params[:id])
  end

private

def inform_params
    params.require(:inform).permit(:name, :resturant_name, :place, :mobile, :email)
  end

end
