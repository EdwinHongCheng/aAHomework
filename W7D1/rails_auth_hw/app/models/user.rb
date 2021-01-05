class User < ApplicationRecord

    # Phase 2: Add validations to the User model

    validates :username, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true

    validates :password_digest, presence: { message: 'Password can\'t be blank' }

    # Note: length: { ... } is in an interesting format, should memorize
    validates :password, length: { minimum: 6, allow_nil: true }

    before_validation :ensure_session_token

    # Phase 3: Add helper methods to the User model

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        if user && BCrypt::Password.new(user.password_digest).is_password?(password)
            return user
        end

        nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

end
