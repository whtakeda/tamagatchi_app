class User < ActiveRecord::Base
 has_secure_password
 # Verify that an email exists and that it does not already exist in the db
 validates :email, presence: true, uniqueness: true
 validates :password, length: { minimum: 4 }

 has_many :messages, :dependent => :destroy
 has_one :tamagatchi
 has_many :comments
# after_save :create_tamagatchi


end
