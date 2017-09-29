class Post < ApplicationRecord
  belongs_to :user, class_name: 'SimpleAdmin::User'
end
