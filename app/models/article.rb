class Article < ApplicationRecord
    validates :name, presence: true,
                uniqueness: true,
                length: {maximum: 100}
    validates :fullbody, presence: true
    has_one_attached :photo
    has_rich_text :fullbody
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
end
