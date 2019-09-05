class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :clickbait_title

    def clickbait_title
        clickbaits = [
            /Won't Believe/i,
            /Secret/i,
            /top \d/i,
            /Guess/i
        ]
        if self.title
            if !clickbaits.any? { |clickbait| self.title =~ clickbait }
                errors.add(:title, "must contain clickbait")
            end
        end
    end
end