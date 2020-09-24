class User < ApplicationRecord
  has_many :tickets
  has_many :comments
end
