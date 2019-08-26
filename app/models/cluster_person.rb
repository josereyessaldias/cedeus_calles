class ClusterPerson < ApplicationRecord
  belongs_to :person
  belongs_to :cluster
end
