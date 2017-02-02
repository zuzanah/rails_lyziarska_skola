ActiveAdmin.register AdminUser do
  config.filters = false
  permit_params :email, :password, :password_confirmation
  config.clear_action_items!
  action_item :only => :index do
    link_to "Pridať admina" , new_admin_admin_user_path
  end

  index do
    selectable_column
    id_column
    column "E-mail", :email
    column "Čas prihlásenia", :current_sign_in_at
    column "Počet prihlásení", :sign_in_count
    column "Vytvorený", :created_at
    actions defaults: false do |admin|
      links = link_to "Zobraziť", admin_admin_user_path(admin), class: "member_link"
      links += link_to "Upraviť", edit_admin_admin_user_path(admin), class: "member_link"
      links += link_to "Odstrániť", admin_admin_user_path(admin), :method => :delete, :data => {:confirm => "Ste si istí?"}, class: "member_link"
      links
    end
  end

  form :title => 'Nový Admin' do |f|
    f.inputs "Údaje admina" do
      f.input :email, label: "E-mail"
      f.input :password, label: "Heslo"
      f.input :password_confirmation, label: "Potvrdenie hesla"
    end
    f.actions do
      f.action :submit, as: :button, label: 'Potvrdiť'
      f.cancel_link(admin_dashboard_path)
    end
  end

end
