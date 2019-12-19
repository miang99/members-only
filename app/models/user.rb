class User < ApplicationRecord
    has_secure_password

    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : #conditional expression
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
        
    end
end
