ActiveAdmin.register Animal do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :earring, :name, :breed, :property_id, :lot_id, :birth, :sex, :source, :active, :blood, :price

  menu parent: 'Cadastro',priority: 1, :label => "Animal"

  index do
    selectable_column
    column :earring
    column :name
    column :sex
    column :lot
    column :property
    column :active
    actions
  end

  

  show do

    attributes_table do
      row :earring
      row :name
      row :breed
      row :property
      row :lot
      row :birth
      row :sex
      row :source
      row :blood
      row :price
      row :active
      row :created_at
      row :updated_at
    end

    panel "Histórico de Pesagem do Animal" do

      table_for animal.weighings.order(checked: :DESC) do
        column :weight
        column :height
        column :checked
      end

      columns do 

        column do
          line_chart  Weighing.where(animal: resource).order(checked: :DESC).pluck(:checked, :weight)
        end

      end

    end
    

    
    panel "Histórico de Vacinas do Animal" do
      table_for animal.medications.order(applied: :DESC) do
        column(:medicament) { |medication| medication.medicament.description }
        column :disease
        column :applied
      end
    end

    panel "Histórico de Alimentação do Animal" do
      table_for animal.feeds.order(firstDate: :DESC) do
        column :lot
        column :food
        column() { |feed| feed.food.description }
        column :firstDate
        column :finaleDate
      end
    end
    
    active_admin_comments
    
  end


    filter :earring
    filter :name
    filter :sex
    filter :lot
    filter :property
    filter :active



end
