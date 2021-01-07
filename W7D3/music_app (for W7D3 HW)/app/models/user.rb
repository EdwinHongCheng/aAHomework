class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }

    after_initialize :ensure_session_token 

    attr_reader :password

    # User::generate_session_token (skipped)
    # prob can safely skip
    # prob just: SecureRandom::urlsafe_base64

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64 
    end

    def reset_session_token! 
        self.session_token = SecureRandom::urlsafe_base64 
        self.save!    
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password 
    end

    def self.find_by_credentials(email, pw)
        user = User.find_by(email: email)

        if user && user.is_password?(pw) #helper method
            user 
        else 
            nil
        end
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end


end
