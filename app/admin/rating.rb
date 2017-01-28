ActiveAdmin.register Rating do
  config.sort_order = "created_at_desc"
  menu label: "Hodnotenia", priority: 3
  permit_params :body, :user_id

  belongs_to :user, :optional => true

  index :title => 'Hodnotenia' do
    column "Užívateľ", :user, :sortable => :user_id
    column "Hodnotenie", :body
    column "Vložené", :created_at
    actions
  end

  show :id => :rating_id do     
    attributes_table do
      row :user
      row :body
    end
    table_for rating.rcomments.order(created_at: :desc) do
      column "Užívateľ", :user
      column "Komentár", :body
      column "Vložené", :created_at
    end
    div do
      link_to('Back', admin_ratings_path)
    end
  end
  
end
