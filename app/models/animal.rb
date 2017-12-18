class Animal < ApplicationRecord
  belongs_to :property
  belongs_to :lot
  has_many :weighings
  has_many :medications


  enum breed: [
    :Holandes, :Girolando, :"Gir Leiteiro", :Jersey, :Guernsey, 
    :Ayrshire, :Caracu, :Simental, :Mestiça, :"Pardo Suíça (Schwyz)", 
    :Outra, :Jersolando, :Nelore, :Angus, :"Red Angus", :"Aberdeen Angus", 
    :Hereford, :Tabapuã, :Senepol, :Brahman, :Kiwi, :Friesian, :Guzerá, 
    :Guzolando, :F1, :S1, :Desconhecida
  ]

  enum blood: [
    :Desconhecido, :"1/8", :"1/4", :"3/8", :"7/16", :"1/2", 
    :"9/16", :"5/8", :"11/16", :"3/4", :"13/16", :"7/8", :"15/16", 
    :"31/32", :PC, :PCOD, :PCOC, :PO, :LA, :CG
  ]

  enum sex:[:Macho, :Femea]

  enum source: [:Nascimento, :Compra]

 

end
