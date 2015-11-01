class User < ActiveRecord::Base
 has_secure_password
 # Verify that an email exists and that it does not already exist in the db
 validates :email, presence: true, uniqueness: true
# validates :password, length: { minimum: 4 }, :if :password_changed?
 validates :password, length: { minimum: 4 }, allow_nil:true
end
