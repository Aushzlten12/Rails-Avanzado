class Review < ActiveRecord::Base
  belongs_to :moviegoer
  belongs_to :movie
  validates :movie_id , :presence => true
  validates_associated :movie
  attribute :potatoes, :integer
end
