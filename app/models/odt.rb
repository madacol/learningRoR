class Odt < ActiveRecord::Base
	belongs_to :razon_social
	has_one :permission_request, as: :auth_record, :dependent => :destroy
	has_many :deducciones_odts, :dependent => :destroy
	has_many :comision_odts, :dependent => :destroy
	has_many :employees, through: :comision_odts
	has_many :pools, as: :category
	accepts_nested_attributes_for :comision_odts, :allow_destroy => true	
	accepts_nested_attributes_for :deducciones_odts, :allow_destroy => true


	def category_name_to_show
		return self.table_name_to_show
	end
	def table_name_to_show
		'Odt'
	end
	def record_name_to_show
		return "#{self.code} #{self.alias}"
	end
end