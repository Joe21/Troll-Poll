class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_hosts

  protected
  def get_hosts
  	@ordered_hosts ||= Host.all.sort! { |a,b| b.votes <=> a.votes }
  end

end
