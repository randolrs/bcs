class Syndicate < ApplicationRecord
  has_many :funding_applications, dependent: :destroy
  
end
