ActiveAdmin.register Instructor do
  menu label: "Inštruktori", priority: 6
  config.clear_action_items!
  permit_params :name, :instructor_type
  filter :id, label: 'ID'
  filter :name, label: 'Meno'
  filter :type, label: 'Typ'
  filter :created_at, label: 'Čas pridania'

  action_item :only => :index do
    link_to "Pridať inštruktora" , new_admin_instructor_path
  end

  index :title => 'Inštruktori' do
    column :id
    column "Meno", :name
    column "Typ", :instructor_type
    column "Pridaný" do |record|
      record.created_at.strftime('%d.%m. %Y')
    end
    actions defaults: false do |instructor|
      links = link_to "Rezervácie", admin_instructor_bookings_path(instructor), class: "member_link"
      links += link_to "Odstrániť", admin_instructor_path(instructor), :method => :delete, :data => {:confirm => "Ste si istí?"}, class: "member_link"
      links
    end
  end

  form :title => 'Nový inštruktor' do |f|
    f.inputs "Údaje nového inštruktora" do
      f.input :name, label: "Meno"
      f.input :instructor_type, label: "Typ"
    end
    f.actions do
      f.action :submit, as: :button, label: 'Vytvoriť inštruktora'
      f.cancel_link(admin_instructors_path)
    end
  end

end
