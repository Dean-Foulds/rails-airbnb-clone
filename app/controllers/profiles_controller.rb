class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :postcode, :company, :avatar)
  end

end




# from users model

# t.string   "avatar"
#     t.string   "company"
#     t.string   "address"
#     t.string   "city"
#     t.string   "post_code"
#     t.string   "mobile_number"
