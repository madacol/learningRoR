class RazonSocial < ActiveRecord::Base
    has_many :odts
    has_many :retenciones
end
