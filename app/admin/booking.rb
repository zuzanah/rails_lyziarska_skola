ActiveAdmin.register Booking do
  permit_params :startdate, :starttime, :user_id, :instructor_id, :body, :_destroy
  config.sort_order = "startdate_asc"
  config.clear_action_items!
  filter :instructor, label: 'Inštruktor'
  filter :user, label: 'Užívateľ', :as => :select, :collection => User.all.map(&:email)
  filter :startdate, label: 'Dátum lekcie'
  filter :created_at, label: 'Čas vloženia'
  filter :updated_at, label: 'Čas zmeny'
  filter :child, label: 'Dieťa', :as => :check_boxes

  action_item :only => :index do
    link_to "Pridať rezerváciu" , new_admin_booking_path
  end

  menu label: "Rezervácie", priority: 5
  belongs_to :user, :optional => true
  belongs_to :instructor, :optional => true

  index :title => 'Rezervácie' do
    column "Deň", sortable: :startdate do |record|
      record.startdate.strftime('%d.%m. %Y')
    end
    column "Čas", sortable: :starttime do |record|
      record.starttime.strftime('%H:%M')
    end
    column "Inštruktor", :instructor_id
    column "Užívateľ", :user_id
    column "Poznámky", :body
    actions defaults: false do |booking|
      links = link_to "Upraviť", edit_admin_booking_path(booking), class: "member_link"
      links += link_to "Odstrániť", admin_booking_path(booking), :method => :delete, :data => {:confirm => "Ste si istí?"}, class: "member_link"
      links
    end
  end

  form :title => 'Rezervácia' do |f|
    f.inputs "Údaje o rezervácii" do
      f.input :instructor, label: "Inštruktor"
      f.input :body, label: "Poznámky"
      f.input :child, label: "Dieťa do 15 rokov?"
      f.input :starttime, label: "Termín", start_hour: 9, end_hour: 15, minute_step: 60
      f.date_field :startdate, min: Date.today+1, max: "2017-04-1"
    end
    f.actions do
      f.action :submit, as: :button, label: 'Potvrdiť'
      f.cancel_link(admin_bookings_path)
    end
  end

end
