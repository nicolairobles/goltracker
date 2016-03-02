class User < ActiveRecord::Base
	has_secure_password
	# attr_accessible :phone_number, :password_digest
end
