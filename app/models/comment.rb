class Comment < ApplicationRecord
    belongs_to :username
    validates_presence_of :username
end