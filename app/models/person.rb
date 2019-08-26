class Person < ApplicationRecord

	has_many :cluster_person
 	has_many :clusters, through: :cluster_person


	has_many :person_product
 	has_many :products, through: :person_product

end
