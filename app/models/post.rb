class Post < ActiveRecord::Base

validates :title, presence: true
 validates :content, length: {minimum: 250}
 validates :summary, length: {maximum: 250}
#validates :content, length: {is: 250}
validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
validate :clickbate

def clickbate_olding
    if self.title
        bait = self.title.split(`w`)
        shared = ["Believe", "Secrete", "Guess", "Top"] & bait
        if shared = []
            errors.add(:title, "isn't clickbate")
        end
    end
end


def clickbate
    
    bait = 0
    if self.title
    words = self.title.split(`w`)
    
   if words.include?("Believe")
        bait = 1
   elsif words.include?("Won't")
        bait = 1
    elsif words.include?("Secrete")
        bait = 1
    elsif words.include?("Guess")
        bait = 1
    elsif words.include?(1..1000)
        bait = 1
    else words.include?("Top")
        bait = 1
    end

    if bait < 1
        errors.add(:title, "isn't clickbate")
        
   end
end
end





# Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", th

end#class end
