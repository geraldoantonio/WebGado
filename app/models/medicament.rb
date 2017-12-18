class Medicament < ApplicationRecord

    enum measure: [ :Alqueire, :Balde, :Caixa, 
                    :Centimetro, :Dose, :Fardo, :Frasco, :Galão, 
                    :Hectare, :Hora, :Litro, :Metro, :"Metro Cúbico", 
                    :"Metro Quadrado", :Mililitro, :Milimetro, :Pacote, 
                    :Par, :Peça, :Quilograma, :Quilometro, :Rolo, 
                    :Saco, :Tonelada, :Unidade
                ]

end
