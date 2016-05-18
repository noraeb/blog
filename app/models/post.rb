class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, :content, :user, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes
end
