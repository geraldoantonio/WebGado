ActiveAdmin.register Discard do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  permit_params :animal_id, :cause_id, :date, :price 



  menu parent: 'Rebanho', :label => "Descarte Animal"


   index do
    selectable_column
    column(:animal) { |discard| discard.animal.earring+' - '+ discard.animal.name }
    column(:motive) { |discard| discard.cause.motive }
    column :cause    
    column :date
    actions
  end
    


  filter :animal
  filter :cause_motive, :as => :string
  filter :cause
  filter :date



  controller do

    before_save do |discard|
      animal = Animal.find(discard.animal_id)
      animal.update(:active => false )
    end
    
    after_destroy do |discard|
      animal = Animal.find(discard.animal_id)
      animal.update(:active => true )
    end

  end #Controller

end
