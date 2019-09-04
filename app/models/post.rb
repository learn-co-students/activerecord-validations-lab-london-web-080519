class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        if self.title != nil && ["Won't Believe", "Secret", "Top [0-9]", "Guess"].any? {|test| self.title.include?(test)}
        # if self.title.match(/Won't Believe|Secret|Top [0-9]|Guess/)
        else
            errors.add(:title, "is not clickbait")
        end
    end
end
