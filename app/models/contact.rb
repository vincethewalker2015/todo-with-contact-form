class Contact < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                     format: { with:  VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
                     #uniqueness: true
    validates :comments, presence: true
    
end