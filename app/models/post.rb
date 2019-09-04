class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :clickbait_validator

    def clickbait?
        result = false
        indicators = [/Won't Believe/, /Secret/, /Top \d\d?/, /Guess/]
        indicators.each do |indicator|
            if self.title.match(indicator)
                result = true
            end
        end
        result
    end

    def clickbait_validator
        if self.title && !self.clickbait?
            errors.add(:title, 'is not clickbaity enough')
        end
    end
    
end
