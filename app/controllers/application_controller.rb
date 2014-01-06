class ApplicationController < ActionController::Base
  before_filter :check_for_conference_year
  before_filter :track_referral_url

  helper_method :check_for_conference_year, :current_user, :current_event

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

  def track_referral_url
    # should only track the first occurance of the referrer
    session[:referral_url] ||= request.referrer
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_event
    @current_event ||= Event.find_by_eid(APP_CONFIG[:eid])
  end

  def render_404
    respond_to do |type|
      type.all {render :template => 'public/404.html'}
    end
  end

end
