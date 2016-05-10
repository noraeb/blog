class Post < ActiveRecord::Base
  validates :title, :content, :admin, presence: true
  belongs_to :admin
end
