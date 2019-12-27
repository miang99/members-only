class Post < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {maximum: 255}
    validates :body, presence: true
    def author
        user = User.find_by(id: self.user_id)
        user.name
        
    end
end