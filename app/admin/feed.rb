ActiveAdmin.register Feed do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :food_id, :animal_id, :lot_id, :firstDate, :finaleDate
#


  menu parent: 'Rebanho', :label => "Alimentação"
  index do
    selectable_column
    column(:brinco) { |feed| feed.animal.earring }
    column :animal
    column :lot
    column :food
    column :firstDate
    column :finaleDate
    actions
  end
  
  show do
    attributes_table do
        row :animal
        row :lot
        row :food
        row :firstDate
        row :finaleDate
        row :created_at
        row :updated_at
    end
    
    active_admin_comments
  end

  filter :animal
  filter :lot
  filter :food
  filter :firstDate
  filter :finaleDate


  config.sort_order = 'finaleDate_desc'
  
  controller do

    before_save do |feed|
      feed.lot.blank?
        feed.lot = Animal.find(feed.animal_id).lot
    end
    
  end #Controller

end
    