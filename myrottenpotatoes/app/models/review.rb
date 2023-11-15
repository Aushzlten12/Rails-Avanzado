class Review < ApplicationRecord
  belongs_to :moviegoer
  belongs_to :movie
end
