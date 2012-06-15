class Keyword < ActiveRecord::Base
  validates :keyword , :uniqueness=>true
end
