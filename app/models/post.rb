class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Non-Fiction Fiction)}
    validate :click_baity

    def click_baity
            arr = [
                /Won't Believe/i,
                /Secret/i,
                /Top [0-9]/i,
                /Guess/
                ]
        if arr.none?{|phrase| phrase.match?(title)}
            errors.add(:title, "d")
        end
    end
end