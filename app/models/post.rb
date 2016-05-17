class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
end
