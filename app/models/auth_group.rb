class AuthGroup < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :is_allowed_to, :dependent => :destroy

	def table_name_to_show
		'Grupo de Autorizacion'
	end
	def record_name_to_show
		return self.name
	end

	def can?(action)
		crud, model = action.split('_') 	# crud = create, read, update or destroy
		model_permissions = self.is_allowed_to.where(action_id: Action.where(name: model) )
		if model_permissions.empty?
			return false
		end
		return model_permissions.last["#{crud}?"]
	end
end