class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_uniqueness_of :post, scope: :user, message: "You can't like this post twice."
end
