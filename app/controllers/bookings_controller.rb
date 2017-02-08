# Kontroler pre rezervacie
class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @user_bookings = @user.bookings
                          .where('startdate >= ?', Date.today)
                          .sort_by { |b| [b.startdate, b.starttime] }
  end

  def new
    @user = current_user
    @instructor = Instructor.find(params[:instructor_id])
    @booking = Booking.new
  end

  def edit
    @user = current_user
    @instructor = @booking.instructor
  end

  def create
    @user = current_user
    @instructor = Instructor.find(params[:instructor_id])
    @booking = @instructor.bookings.create(booking_params)
    @booking.user_id = @user.id
    respond_to do |format|
      if @booking.save
        if !Booking.where(instructor: @instructor,
                          startdate: @booking.startdate,
                          starttime: @booking.starttime)
                   .where.not(id: @booking.id).empty?
          @booking.destroy
          @reserved = Booking.where(instructor: @instructor,
                                    startdate: @booking.startdate)
          format.html { render 'instructors/reserved' }
        else
          format.html do
            redirect_to user_bookings_path(@user),
                        notice: 'Vaša rezervácia bola úspešne vytvorená.'
          end
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @booking.update(booking_params)
        format.html do
          redirect_to user_bookings_path(@user),
                      notice: 'Rezervácia bola zmenená.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user = current_user
    @booking.destroy
    respond_to do |format|
      format.html do
        redirect_to user_bookings_path(@user),
                    notice: 'Rezervácia bola odstránená.'
      end
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:startdate, :starttime, :user,
                                    :instructor, :body, :child)
  end
end
