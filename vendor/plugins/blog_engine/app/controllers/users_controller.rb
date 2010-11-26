class UsersController < ApplicationController
  before_filter :redirect_and_warn

  def redirect_and_warn
    redirect_to root_url, :notice => "You cannot sign up"
  end
end
