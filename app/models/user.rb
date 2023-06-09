class User < ApplicationRecord
    # attr_accessible :email, :password, :password_confirmation
    has_many :bugs 
    has_many :project_users
    has_many :projects ,through: :project_users
   accepts_nested_attributes_for :project_users ,  :allow_destroy => true

    enum role: {seller: 0, buyer: 1, admin: 2}

    # ?authentication
    USER_TYPE=['Manager','Q/A',"Developer"]
    attr_accessor :password
    before_save :encrypt_password
    
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :email
    validates_uniqueness_of :email
    
    def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
    
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
end
