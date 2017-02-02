ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
      columns do
        column do
          panel "Najnovšie hodnotenia" do
            table_for Rating.order("created_at desc").limit(5) do
              column "Užívateľ", :user, :sortable => :user_id
              column "Hodnotenie", :body
              column "Vložené", :created_at
            end
            strong { link_to "Zobraziť všetky hodnotenia", admin_ratings_path }
          end
        end
        column do
          panel "Aktuality" do
            table_for Skinew.order("created_at desc").limit(5) do
              column "Nazov", :title
              column "Obsah", :body
              column "Vložené", :created_at
            end
            strong { link_to "Zobraziť všetky aktuality", admin_skinews_index_path }
          end
        end
      end
      columns do
      column do
          panel "Rezervácie dnes" do
            table_for Booking.where(:startdate => Date.today).order("startdate asc, starttime asc").limit(5) do
              column "Deň", sortable: :startdate do |record|
                record.startdate.strftime('%d.%m. %Y')
              end
              column "Čas", sortable: :starttime do |record|
                record.starttime.strftime('%H:%M')
              end
              column "Inštruktor", :instructor_id
              column "Užívateľ", :user_id
              column "Poznámky", :body
            end
            strong { link_to "Zobraziť všetky rezervácie", admin_bookings_path }
          end
      end
      end
  end

end
