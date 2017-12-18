class Lot < ApplicationRecord

  enum phase: [
        :"Bezerros(as) até 6 meses", :"Bezerros(as) de 7 até 12 meses", 
        :"Novilhos(as) acima de 12 meses", :"Novilhas prenhas", 
        :"Vacas em lactação", :"Vacas secas", :"Enfermaria", :"Touros", 
        :"Engorda", :"Pré-Parto"
  ]

end
