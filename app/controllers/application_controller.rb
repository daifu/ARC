class ApplicationController < ActionController::Base
  before_filter :check_for_conference_year
  helper_method :check_for_conference_year

  protect_from_forgery
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  def check_for_conference_year
    session[:year_override] = params[:year] if params[:year]
    prepare_for_year if year_detected?
  end

  def prepare_for_year
    prepend_view_path Rails.root + 'app' + "#{ENV['ARC_CONFERENCE_YEAR']}_view"
  end

  def year_detected?
    !ENV['ARC_CONFERENCE_YEAR'].nil? ? true : false;
  end

end
