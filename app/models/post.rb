require 'pry'
class Post < ActiveRecord::Base
    belongs_to :author 
    validates :title, presence: true 
    validates :summary, length: { maximum: 250 }
    validates :content, length: { minimum: 100 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

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

    def is_clickbait?
        if self.title && !self.clickbait?
            errors.add(:title, 'is not clickbaity enough')
        end
    end





            #search through the list of titles

            #find titles matching any of the given strings 

            #find article associated with that title 

            #return article 

       
end
