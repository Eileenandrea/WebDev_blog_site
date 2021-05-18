class Article < ApplicationRecord
    validates :name, presence: true,
                uniqueness: true
     has_one_attached :photo
     has_rich_text :fullbody
end
