class PermissionRequest < ActiveRecord::Base
	class YamlObject
		def self.load(object)
			return YAML.load(object) unless object.nil?
		end
		def self.dump(object)
			return object.to_yaml.to_s unless object.nil?
		end
	end

  belongs_to :auth_record, polymorphic: true
  serialize :auth_record_object

	def table_name_to_show
		'Solicitud de Aprobacion'
	end
	def record_name_to_show
		return self.auth_record.record_name_to_show
	end
end
