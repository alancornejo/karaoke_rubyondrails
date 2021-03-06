# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  nombre         :string
#  tipo           :string
#  precio         :decimal(, )
#  disponibilidad :string(1)
#  local_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Product < ApplicationRecord
	belongs_to :local

  # Confirmamos el email y validamos que no sean vacios con presence
  # mostramos el mensaje de error con message
  validates :nombre , confirmation: true, presence: { message: " es requerido"}
  #validates :precio, numericality: { only_integer: true }
  validates :disponibilidad , confirmation: true, presence: { message: " es requerido"}
  validates :tipo , confirmation: true, presence: { message: " es requerido"}

  validates :local_id , presence: true , confirmation: true

end
