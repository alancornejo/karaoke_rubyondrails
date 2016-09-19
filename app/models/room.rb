# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  nombre      :string
#  capacidad   :integer
#  descripcion :text
#  local_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :local
  	#Validaciones de Presencia
	validates :nombre , presence: true , confirmation: true
	validates :capacidad , presence: true , confirmation: true
	validates :local_id , presence: true , confirmation: true

end
