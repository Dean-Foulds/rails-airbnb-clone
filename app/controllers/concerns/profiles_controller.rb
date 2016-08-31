class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]

def show
  @profile = User.new
end



private

  def set_profile
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:address, :post_code, :email, :password, :pictures => [])
  end

end
