ActiveAdmin.register_page "Dashboard" do

  menu label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    

    columns do

      column do


        #Animals of Breed
        panel "Animais por Raça" do
          pie_chart Animal.where(active: true).group('breed').count
        end
        
        #Animals of Lot
        panel "Lote de Animais" do
          column_chart Animal.where(active: true).joins(:lot).group('lots.name').count
        end     

        #Medication
        panel "Vacinação" do
          line_chart Medication.joins(:medicament).group('medicaments.description').group_by_week('applied').count
        end



      end

    end # colums


  end # content
end
