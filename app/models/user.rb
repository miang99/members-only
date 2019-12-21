class User < ApplicationRecord
    attr_reader :remember_token
    has_secure_password

    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : #conditional expression
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
        
    end

    def self.new_token
        # create random token
        SecureRandom.urlsafe_base64        
    end

    def remember
        # set remember_token and update remember_digest
        @remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(@remember_token))        
    end

    def forget
        @remember_token = nil
        update_attribute(:remember_digest, nil)
        
    end
 
    #override method authenticate to user for password and check cookies
    def authenticate?(attribute, token)
        # get digest attr from database
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        # check the token
        BCrypt::Password.new(digest).is_password?(token)
        
    end

    
end
