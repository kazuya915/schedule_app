class Post < ApplicationRecord
    
    validates :title, presence: true, length: { maximum: 20 }
    validates :start_at, presence: true
    validates :end_at, presence: true
    validates :memo, length: { maximum: 140 }
    def end_correct
        errors.add(:end_at,"は開始日の後の日付から選択してください")
        if post.start_at > post.end_at
        end
    end
        
    validate :end_correct
    def end_correct
        errors.add(:end_at, "は開始日より後の日付から選択してください") unless
        self.start_at <= self.end_at 
        end
    
end
