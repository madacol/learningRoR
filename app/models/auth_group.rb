class AuthGroup < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :is_allowed_to, :dependent => :destroy
	has_many :action, through: :is_allowed_to

	def table_name_to_show
		'Grupo de Autorizacion'
	end
	def record_name_to_show
		return self.name
	end

	def can(action, *set_action)
		crud, model = action.split('_', 2) 	# crud = create, read, update or destroy
		model_permission= self.is_allowed_to.find_by( action_id: Action.where(name: model) )
		if model_permission.nil?
			unless set_action.empty?
				model_permission = self.is_allowed_to.create(action_id: Action.find_by(name: model).id )
				return model_permission.update "#{crud}?": set_action.first
			end
			return false
		end
		unless set_action.empty?
			return model_permission.update "#{crud}?": set_action.first
		end
		return model_permission["#{crud}?"]
	end
end