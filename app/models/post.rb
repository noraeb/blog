class Post < ActiveRecord::Base
  validates :title, :content, :admin, presence: true
  belongs_to :admin
  has_many :comments, dependent: :destroy
end
