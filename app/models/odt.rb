class Odt < ActiveRecord::Base
    belongs_to :razon_social
    has_many :deducciones_odts
    has_many :comision_odts
	has_many :employees, through: :comision_odts
	has_many :pools, as: :category
end
