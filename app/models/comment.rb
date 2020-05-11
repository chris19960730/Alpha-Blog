class Comment < ApplicationRecord
  belongs_to :article, dependent: :destroy
  validates :author_name, presence: true
  validates :content, presence: true, length: { minimum: 3, maximum: 300 }
end
