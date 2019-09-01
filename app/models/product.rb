class Product < ApplicationRecord

	has_many :person_product
 	has_many :persons, through: :person_product

 	enum tipo: { revista_isi: 0, revista_no_isi: 1, libro: 2 }
end
