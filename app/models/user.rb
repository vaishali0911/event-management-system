class User < ApplicationRecord
  has_many :events
  belongs_to :registration
end
