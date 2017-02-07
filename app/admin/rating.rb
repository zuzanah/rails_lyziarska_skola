ActiveAdmin.register Rating do
  config.sort_order = "created_at_desc"
  config.clear_action_items!
  menu label: "Hodnotenia", priority: 3
  permit_params :body, :user_id
  #filter :user_id, label: 'Užívateľ', :as => :select, :collection => User.all.map(&:email)
  #filter :body, label: 'Obsah'
  #filter :created_at, label: 'Čas vloženia'

  belongs_to :user, :optional => true

  index :title => 'Hodnotenia' do
    column "Užívateľ", :user, :sortable => :user_id
    column "Hodnotenie", :body
    column "Vložené" do |record|
      record.created_at.strftime('%d.%m. %Y')
    end
    actions defaults: false do |rating|
      links = link_to "Zobraziť", admin_rating_path(rating), class: "member_link"
      links += link_to "Odstrániť", admin_rating_path(rating), :method => :delete, :data => {:confirm => "Ste si istí?"}, class: "member_link"
      links
    end
  end

  show :id => :rating_id do     
    attributes_table do
      row 'Užívateľ' do |u|
        u.user
      end
      row 'Hodnotenie' do |u|
        u.body
      end
    end
    if !rating.rcomments.empty?
      table_for rating.rcomments.order(created_at: :desc) do
        column "Užívateľ", :user
        column "Komentár", :body
        column "Vložené" do |record|
          record.created_at.strftime('%d.%m. %Y')
        end
      end
    end
    div do
      link_to('Dozadu', admin_ratings_path)
    end
  end
  
end
