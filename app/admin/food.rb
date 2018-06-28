ActiveAdmin.register Food do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
      permit_params :description, :name 
    #
    
      menu parent: 'Cadastro', priority: 2, :label => "Alimentos"
        
      index do
        selectable_column
        column :name
        column :description
        actions
      end
    
      filter :name
    end
    