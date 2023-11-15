class Moviegoer < ApplicationRecord
  def self.create_with_omniuth(auth)
    Moviegoer.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
end
