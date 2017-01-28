ActiveAdmin.register Skinew do
  config.sort_order = "created_at_desc"
  menu label: "Aktuality", priority: 4
  permit_params :title, :body

  index :title => 'Aktuality' do
    column "Aktualita", :title
    column "Obsah", :body
    column "Vložené", :created_at
    actions
  end

  show :id => :skinew_id do     
    attributes_table do
      row :id
      row :title
      row :body
      row :created_at
    end
    div do
      link_to('Back', admin_skinews_index_path)
    end
  end

end
