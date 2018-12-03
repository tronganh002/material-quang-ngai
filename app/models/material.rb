class Material < ApplicationRecord
  has_many :statistics
  enum type_mt: [:material_type, :revenue_type]
end
