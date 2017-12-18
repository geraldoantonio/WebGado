ActiveAdmin.register Property do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :proprietary, :size, :state, :city, :phone, :comunity, :complement, :active 
 #
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  menu parent: 'Cadastro', :label => "Propriedade"
    
  index do
    selectable_column
    column :name
    column :proprietary
    column :phone
    column :active
    actions
  end

  show do
    attributes_table do
      
      row :name
      row :proprietary
      row :size
      row :state
      row :city
      row :phone
      row :comunity
      row :complement
      row :active 
      row :created_at
      row :updated_at
 
     end

    panel "Total de Animais Ativos na Propriedade - #{property.name}" do
    
      columns do 
        column do
          bar_chart Animal.where(property_id: property.id, active: true).joins(:property).group('properties.name').count
        end
      end

    end
    
     active_admin_comments

  end


  filter :name
  filter :proprietary
  filter :phone
  filter :active
end
