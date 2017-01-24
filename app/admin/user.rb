ActiveAdmin.register User do
  menu label: "Užívatelia", priority: 2
  permit_params :nickname, :email

  index :title => 'Užívatelia' do
    column :id
    column "e-mail", :email
    column "Užívateľské meno", :nickname
    actions
  end

  show :id => :user_id do     
    attributes_table do
      row :nickname
      row :email
      row :Hodnotenia do
        link_to('Hodnotenia', admin_user_ratings_path(user))
      end
    end
  end

end
