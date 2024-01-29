class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # for now we are skipping protection for sending a token from the frontend to backend to validate the request is from my app
  skip_forgery_protection
end
