class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  #signed_in?
  #authicate

end
