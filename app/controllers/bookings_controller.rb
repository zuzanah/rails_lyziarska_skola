class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @user = current_user
    @booking = Booking.new
  end

  def edit
  end

  def create
    @user = current_user
    @booking = @user.bookings.create(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to user_bookings_path(@user), notice: 'Booking was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
    end
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start, :user, :instructor, :body, :child)
    end
end
