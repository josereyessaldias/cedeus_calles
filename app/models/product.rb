class Product < ApplicationRecord

	has_many :person_product, dependent: :destroy
 	has_many :persons, through: :person_product

 	enum tipo: { revista_isi: 0, revista_no_isi: 1, libro: 2, congreso: 3, organizacion: 4, colabaracion: 5, tesis: 6, financiamiento: 7 }

 	mount_uploader :file, RespaldoUploader
end
