namespace :dev do

  desc "Setup Development"
  task setup: :environment do


    puts ">>>> Executando o setup para desenvolvimento <<<<"

      puts "Apagando Banco de Dados... #{%x(rake db:drop)}"
      puts "Criando Banco de Dados...  #{%x(rake db:create)}"
      puts %x(rake db:migrate)
      puts %x(rake db:seed)
      puts %x(rake dev:generate_property)
      puts %x(rake dev:generate_animals)
      puts %x(rake dev:generate_causes)
      puts %x(rake dev:generate_weighings)

    puts ">>>>       Setup concluido com sucesso!    <<<<<"
    

  end
  

##############################################################################
 

##############################################################################

  desc "Generate Faker Property"
  task generate_property: :environment do
    puts "Generate Faker Property..."
    bar = RakeProgressbar.new(3)
    3.times do
      bar.inc
      farm = Property.new(
                   name: "Farm "+Faker::Company.name, 
                   city: Faker::Address.city, 
                   state: Faker::Address.state, 
                   active: true,
                   proprietary: Faker::Name.name,
                   size: 325 ,
                   phone: "(99)98877-6655",
                   comunity: Faker::Address.community,
                   complement: "" ,

      )

      farm.save!
    end
    bar.finished
  end
##############################################################################

  desc "Generate Faker Animals"
  task generate_animals: :environment do
    puts "Generate Faker Animal..."
    bar = RakeProgressbar.new(100)
    100.times do
      bar.inc
     
      animal = Animal.new(

                  earring: (100..1000).to_a.sample,
                  name: Faker::Pokemon.name, 
                  property: Property.all.sample,
                  lot: Lot.all.sample,
                  birth: Faker::Date.birthday(1, 4), 
                  active: [0, 1, 1, 1].sample,

                  sex: [0,1].sample,
                  blood: (0..19).to_a.sample,
                  breed: (0..25).to_a.sample,
                  source: [0, 1].sample ,

                  price: 0

      )

      animal.save!
    end
    bar.finished
  end

##############################################################################


  desc "Generate Faker Medication"
  task generate_medications: :environment do
    puts "Generate Faker Medications..."
    bar = RakeProgressbar.new(Animal.all.count)
    Animal.all.each do |animal|
      bar.inc

      5.times do
        medication = Medication.new(
                    
                    animal: animal, 
                    medicament: Medicament.all.sample, 
                    applied: Faker::Date.between(300.days.ago, Date.today),
                    disease: (0..30).to_a.sample

        )

        medication.save!
      end
    end
    bar.finished
  end

##############################################################################


  desc "Generate Faker Weighing"
  task generate_weighings: :environment do
    puts "Generate Faker Weighings..."
    bar = RakeProgressbar.new(Animal.all.count)
    Animal.all.each do |animal|
      bar.inc
      
      4.times do
        weighing = Weighing.new(
                    
                    animal: animal, 
                    weight: (100..500).to_a.sample,
                    checked:Faker::Date.between(animal.birth, Date.today),
                    height: [1.5, 1.6, 1.7 ].sample

        )

        weighing.save!
      end
    end
    bar.finished
  end

##############################################################################

  desc "Generate  Discard Cause"
  task generate_causes: :environment do
    puts "Generate Causes..."

# Causes 0 - Morte, 1 - Venda, 2 - Roubo, 3 - Outro
  causes = [
    [
    "Babesia", "Clostridioses", "Descarga Elétrica", "Deslocamento de abomaso",
    "Desnutrição", "Diarréia", "Distocia", "Doenças metabólicas", "Hipocalcemia", 
    "Indefinida", "Intoxicação", "Mastite", "Morte Natural", "Pneumonia", 
    "Problemas de casco", "Queda / acidentes", "Raiva", 
    "Rinotraqueíte infecciosa bovina", "Tristeza parasitária bovina", 
    "Verminose", "Outras - Morte"],
    [
      "Aprumos", "Baixa produção", "Genética","Idade", "Mastite Crônica", 
      "Número de tetas", "Preço", "Problemas de casco", "Problemas reprodutivos", 
      "Temperamento", "Outras - Venda "],
    [
      "Roubo"],
    [
      "Outras Causas"]
  ]
    bar = RakeProgressbar.new(causes.length)
      bar.inc

      causes.length.times do |i|
        causes[i].map {|v | v }.each do |k|
           cause = Cause.find_or_create_by(
              name: k,
              motive: i
            )
           cause.save!
        end
      end

    bar.finished
  end

end
