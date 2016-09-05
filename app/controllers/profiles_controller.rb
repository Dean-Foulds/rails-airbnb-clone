class ProfilesController < ApplicationController
  def index
  end

  def show
    authorize current_user
  end

  def edit
    authorize current_user
  end

  def update
    authorize current_user
    if current_user.update(user_params)
      redirect_to edit_profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:mobile_number, :first_name, :last_name, :address, :city, :post_code, :company, :avatar)
  end

end



