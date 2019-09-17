class Product < ApplicationRecord

	has_many :person_product, dependent: :destroy
 	has_many :persons, through: :person_product
 	has_many :respaldos, dependent: :destroy

 	enum tipo: { revista_isi: 0, revista_no_isi: 1, libro: 2, congreso: 3, organizacion: 4, colabaracion: 5, tesis: 6, financiamiento: 7 }

	enum tipocongreso: {International_congress: 1, national_congress: 2, workshop: 3, course: 4, conferece: 5}

	enum tipoorganizacion: {Inter_congress: 1, Latinamerican_congress:2, Nat_congress: 3, Workshop: 4, Course: 5, Conferece: 6}

end
