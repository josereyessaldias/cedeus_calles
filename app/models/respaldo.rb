class Respaldo < ApplicationRecord
  belongs_to :product

  mount_uploader :file, RespaldoUploader
  
end
