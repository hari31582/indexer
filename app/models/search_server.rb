class SearchServer < ActiveRecord::Base
  validates :server ,
             :base_url,
             :uniqueness=>true

end
