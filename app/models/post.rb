class Post < ApplicationRecord
    belongs_to :username
    has_many :comments
end