class Pool < ActiveRecord::Base
  belongs_to :odt
  belongs_to :gg
  belongs_to :inversion
  belongs_to :loan
  belongs_to :retencione
end
