class PersonProduct < ApplicationRecord
  belongs_to :person
  belongs_to :product

  enum contact: { nn: 0, principal_author: 1, corresponding_author: 2, principal_and_corresponding_author: 3 }
  enum rol: { author: 0, editor: 1, }

  attribute :contact, :integer, default: :nn
  attribute :rol, :integer, default: :author

end
