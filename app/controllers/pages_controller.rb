class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :message ]

  def home
  end

  def contact
  end

  def about
  end

end
