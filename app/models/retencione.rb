class Retencione < ActiveRecord::Base
  belongs_to :razon_social
  has_many :pools, as: :category
end
