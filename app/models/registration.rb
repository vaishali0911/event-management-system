class Registration < ApplicationRecord
  belongs_to :Users
  belongs_to :Events
end
