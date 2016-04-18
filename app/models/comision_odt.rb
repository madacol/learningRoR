class ComisionOdt < ActiveRecord::Base
  belongs_to :odt
  belongs_to :employee
end
