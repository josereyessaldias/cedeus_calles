class Person < ApplicationRecord




	has_many :cluster_person, dependent: :destroy
 	has_many :clusters, through: :cluster_person


	has_many :person_product, dependent: :destroy
 	has_many :products, through: :person_product

end
