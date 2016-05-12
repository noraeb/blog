class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, :content, :admin, presence: true
  belongs_to :admin
  has_many :comments, dependent: :destroy
end
