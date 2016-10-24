class Cierre < ActiveRecord::Base	
	enum account: [ "Pool","Banesco", "Bdv", "Bod", "Mercantil", "Provincial" ]
end
