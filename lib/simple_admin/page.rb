module SimpleAdmin
  class Page < ApplicationRecord
    has_many :widgets
  end
end
