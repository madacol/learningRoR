class Pool < ActiveRecord::Base
	belongs_to :category, polymorphic: true
	has_one :permission_request, as: :auth_record, :dependent => :destroy
	belongs_to :razon_social
	belongs_to :account
	belongs_to :payment_method
	
	def table_name_to_show
		return self.account.name
	end
	def record_name_to_show
		return self.description
	end

	private
	def is_integer?(string)
		string.to_i.to_s == string
	end
end