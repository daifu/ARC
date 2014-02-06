# CouponController, that generate coupons
class CouponsController < ApplicationController
  before_filter :get_coupon_class,   :only => [:create]
  before_filter :fixed_expired_date, :only => [:create]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coupons }
    end
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coupon }
    end
  end

  def select
    @coupon_types = Coupon.subclasses
  end

  # GET /coupons/new
  # GET /coupons/new.json
  def new
    @coupon = params[:coupon_type].constantize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coupon }
    end
  end

  # GET /coupons/1/edit
  def edit
    @coupon = Coupon.find(params[:id])
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = @coupon_type.classify.constantize.new(params[@coupon_type])

    respond_to do |format|
      if @coupon.save
        format.html do
          redirect_to coupon_url(@coupon),
          notice: 'Coupon was successfully created.'
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /coupons/1
  # PUT /coupons/1.json
  def update
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      if @coupon.update_attributes(params[@coupon.param_id])
        format.html do
          redirect_to coupon_url(@coupon),
          notice: 'Coupon was successfully updated.'
        end
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to coupons_url }
      format.json { head :no_content }
    end
  end

  private

  def get_coupon_class
    @coupon_type = params[:coupon_type]
  end

  def fixed_expired_date
    params[@coupon_type][:expired_at] = Date.strptime(
      params[@coupon_type][:expired_at],
      '%m/%d/%Y').yyyymmddhhii_hyphen
  end
end
