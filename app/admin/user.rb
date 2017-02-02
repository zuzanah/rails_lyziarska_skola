ActiveAdmin.register User do
  menu label: "Užívatelia", priority: 2
  permit_params :nickname, :email
  config.clear_action_items!
  filter :id, label: 'ID'
  filter :email, label: 'E-mail'
  filter :nickname, label: 'Užívateľské meno'

  index :title => 'Užívatelia' do
    column :id
    column "e-mail", :email
    column "Užívateľské meno", :nickname
    actions defaults: false do |user|
      link_to "Rezervácie", admin_user_bookings_path(user), class: "member_link"
    end
  end

  show :id => :email do     
    attributes_table do
      row :nickname
      row :email
      row :Hodnotenia do
        link_to('Hodnotenia', admin_user_ratings_path(user))
      end
    end
  end

end
