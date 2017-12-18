ActiveAdmin.register Lot do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :description, :phase
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  menu parent: 'Cadastro', :label => "Lote de Animais"
    
  index do
    selectable_column
    column :name
    column :description
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :phase
      row :created_at
      row :updated_at
     end

    panel "Total de Animais Ativos no Lote - #{lot.name}" do
    
      columns do 
        column do
          bar_chart Animal.where(lot_id: lot.id, active: true).joins(:lot).group('lots.name').count
        end
      end

    end
    
     active_admin_comments

  end

  filter :name
  filter :description
end
