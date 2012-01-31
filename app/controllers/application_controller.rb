class ApplicationController < ActionController::Base
  protect_from_forgery
#  before_filter :session_expiry
#  before_filter :update_activity_time

#  include SessionsHelper

#  def session_expiry
#    get_session_time_left
#    unless @session_time_left > 0
#      sign_out
#      deny_access "Your session has timed out. Please sign back in."
#    end
#  end

#  def update_activity_time
#    session[:expires_at] = 30.minutes.from_now
#  end

#  private

#  def get_session_time_left
#    expire_time = session[:expires_at] || Time.now
#    @session_time_left = (expire_time - Time.now).to_i
#  end

end

