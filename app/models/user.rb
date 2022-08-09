class User < ApplicationRecord
    before_save {self.email.downcase!}
    validates :user_name, presence: true, length:{maximum: 20}
    validate :day_after_today
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                uniqueness: {case_sensitive: false}
    has_secure_password
    has_many :tasks
    def day_after_today
        unless :birthday == nil
          errors.add(:birthday, 'は、今日を含む過去の日付を入力して下さい') if birthday > Date.today
        end
      end
end
