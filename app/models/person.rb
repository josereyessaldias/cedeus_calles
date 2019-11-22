class Person < ApplicationRecord

	has_many :cluster_person, dependent: :destroy
 	has_many :clusters, through: :cluster_person


	has_many :person_product, dependent: :destroy
 	has_many :products, through: :person_product

 	enum proyecto: { _: 0, Energía: 1, Cuencas: 2, Accesibilidades: 3, Territorios: 4, Calles: 5}

 	has_many :comments, dependent: :destroy

end
