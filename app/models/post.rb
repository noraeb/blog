class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, :content, :admin, presence: true
  belongs_to :admin
  has_many :comments, dependent: :destroy
  has_many :likes

  def like_from(user)
    likes.where(user: user).first
  end
end
