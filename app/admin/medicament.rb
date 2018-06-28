ActiveAdmin.register Medicament do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :description, :carencyday, :usemode, :measure 
#

  menu parent: 'Sanitário', :label => "Medicamento"
    
  index do
    selectable_column
    column :description
    column :usemode
    column :carencyday
    actions
  end

  filter :description
  filter :usemode
  filter :carencyday
end
