ActiveAdmin.register Medication do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :medicament_id, :animal_id, :applied, :disease
#


  menu parent: 'Sanitário', :label => "Medicação"
  index do
    selectable_column
    column(:animal) { |medication| medication.animal.earring+' - '+ medication.animal.name }
    column :disease
    column :applied
    actions
  end
  
  show do
    attributes_table do
      row(:animal) { |medication| medication.animal.earring+' - '+ medication.animal.name }
      row(:medicament) { |medication| medication.medicament.description }
      row :disease
      row :applied
      row :created_at
      row :updated_at
    end
    
    active_admin_comments
  end

  filter :animal
  filter :disease
  filter :applied


  config.sort_order = 'applied_desc'

end
