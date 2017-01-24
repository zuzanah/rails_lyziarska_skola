ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
      columns do
        column do
          panel "Hodnotenia" do
            table_for Rating.order("created_at desc").limit(5) do
              column "Užívateľ", :user, :sortable => :user_id
              column "Hodnotenie", :body
              column "Vložené", :created_at
            end
            strong { link_to "Zobraziť všetky hodnotenia", admin_ratings_path }
          end
        end
        column do
        # ...
        end
      end

  end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
    # content
end
