class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to edit_profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:mobile_number, :first_name, :last_name, :address, :city, :postcode, :company, :avatar)
  end

end



