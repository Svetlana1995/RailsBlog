class Post < ActiveRecord::Base
 validates :title, presence: true, length: {minimum: 10}
 has_many :comments, dependent: :destroy
 belongs_to :user
end
