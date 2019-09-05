class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non Fiction"]}
    validate :is_clickbait?

    # clickbaits = [
    #     "Won't Believe", 
    #     "Secret", 
    #     "Top [number]",
    #     "Guess"
    # ]

    def is_clickbait?
        clickbaits = ["Won't Believe", "Secret", "Top [number]", "Guess" ]
        if title != nil && clickbaits.none?{|clickbait| self.title.include?(clickbait)}
            errors.add(:is_clickbait?, 'Invalid title')
        end
    end
end
