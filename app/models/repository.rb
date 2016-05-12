class Repository < ApplicationRecord
  belongs_to :user

  def builds_url
    URI.join(Hound::SITE, "builds").to_s
  end

  def activate
    
  end
end
