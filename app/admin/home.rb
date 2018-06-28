ActiveAdmin.register_page "Home" do

  menu priority: 1, label: proc{ I18n.t("active_admin.home") }

  content title: proc{ I18n.t("active_admin.home") } do

    div do
      image_tag("wallpaper.jpg", size: '1800x420')
    end
    
  end # content
end
