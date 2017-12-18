ActiveAdmin.register Weighing do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :animal_id, :weight, :checked, :height
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  menu parent: 'Rebanho', :label => "Pesagem Animal"

  index do
    selectable_column
    column(:animal) { |weighing| weighing.animal.earring+' - '+ weighing.animal.name }
    column :checked
    column :weight
    column :height
    actions
  end

  filter :animal
  filter :checked
  filter :weight
  filter :height


  config.sort_order = 'checked_desc'
end
