class Cause < ApplicationRecord

  enum motive: [
    :Morte, :Venda, :Roubo, :Outro
  ]
  
end
