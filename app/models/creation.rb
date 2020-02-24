class Creation < ApplicationRecord
  belongs_to :product

  enum stage: {Investigación: 0, Aceptado: 1}
end
