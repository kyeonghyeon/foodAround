class Post < ActiveRecord::Base
    # 여러 comments를 가지고 있다.
    has_many :comments, dependent: :destroy
    belongs_to :university
    
    def self.search(search=nil)
        if search
            where('title LIKE ?', "%#{search}%")
        else
            all
        end
    end
    
    def self.select(university_id=nil)
        if search
            where('university_id = ?', "#{university_id}")
        else
            all
        end
    end
    

end
