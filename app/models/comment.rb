class Comment < ActiveRecord::Base
    # 하나의 post에 속해있다.
    belongs_to :post
end
