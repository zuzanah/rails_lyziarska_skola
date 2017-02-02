ActiveAdmin.register Skinew do
  config.sort_order = "created_at_desc"
  config.clear_action_items!
  menu label: "Aktuality", priority: 4
  permit_params :title, :body
  filter :title, label: 'Názov'
  filter :created_at, label: 'Čas vloženia'
  filter :updated_at, label: 'Čas úpravy'


  action_item :only => :index do
    link_to "Pridať aktualitu" , new_admin_skinews_path
  end

  index :title => 'Aktuality' do
    column "Aktualita", :title
    column "Obsah", :body
    column "Vložené" do |record|
      record.created_at.strftime('%d.%m. %Y')
    end
    actions defaults: false do |skinew|
      links = link_to "Upraviť", edit_admin_skinews_path(skinew), class: "member_link"
      links += link_to "Odstrániť", admin_skinews_path(skinew), :method => :delete, :data => {:confirm => "Ste si istí?"}, class: "member_link"
      links
    end
  end

  show :id => :skinew_id do     
    attributes_table do
      row 'Názov' do |sn|
        sn.title
      end
      row 'Popis' do |sn|
        sn.body
      end
      row 'Vložené' do |record|
        record.created_at.strftime('%d.%m. %Y')
      end
    end
    div do
      link_to('Dozadu', admin_skinews_index_path)
    end
  end

  form :title => 'Upraviť aktualitu' do |f|
    f.inputs "Aktualita" do
      f.input :title, label: "Názov"
      f.input :body, label: "Popis"
    end
    f.actions do
      f.action :submit, as: :button, label: 'Potvrdiť'
      f.cancel_link(admin_skinews_index_path)
    end
  end

end
