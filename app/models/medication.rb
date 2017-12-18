class Medication < ApplicationRecord
  belongs_to :animal
  belongs_to :medicament

  

  enum disease: [
    :Carrapaticida, :"Mastite", :"Tristeza parasitária bovina", 
    :"Afecções de casco", :"Hipocalcemia (Febre do Leite)", 
    :"Retenção de placenta", :"Botulismo", :"Brucelose", 
    :"Carbúnculo Sintomático", :"Diarréia", 
    :"Estefanofilariose (Úlcera de lactação)", :"Febre Aftosa", 
    :"Leptospirose", :"Metrite", :"Papilomatose", :"Pneumonia", 
    :"Raiva", :"Tétano", :"Timpanismo", :"Tuberculose", :"Outro", 
    :"Indução de cio", :"Boostin", :"Cisto Ovário Direito (COD)", 
    :"Cisto Ovário Esquerdo (COE)", :"Vermifugação", :"Infusão intra-uterina", 
    :"IBR", :"Intoxicação", :"Secagem", :"Indução de Lactação"
  ]


end
