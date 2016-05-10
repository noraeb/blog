class Post < ActiveRecord::Base
  belongs_to :admin
  validates :title, :content, :admin, presence: true
end
