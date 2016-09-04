class MessagesController < ApplicationController
def show
    authorize current_user
end

def new
  @message = Message.new
  authorize @message
end

def edit
  authorize current_user
end

def update
  authorize current_user
  if current_user.update(mesage_params)
    redirect_to edit_profile_path
  else
    render :edit
  end
end

private

def message_params
  params.require(:message).permit(:name, :email, :content)
end

end
