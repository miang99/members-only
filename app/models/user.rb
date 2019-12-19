class User < ApplicationRecord
    has_secure_password

    def self.digest(password)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : #conditional expression
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(password, cost: cost)
        
    end
    
end
