class PermissionRequest < ActiveRecord::Base
  belongs_to :auth_record, polymorphic: true

	def table_name_to_show
		'Solicitud de Aprobacion'
	end
	def record_name_to_show
		return self.auth_record.record_name_to_show
	end
end
