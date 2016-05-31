class Repository < ApplicationRecord
  belongs_to :user
  has_many :builds, dependent: :destroy

  scope :active, -> { where(active: true) }

  def activate(change_to = true)
    client = get_client(user)
    if change_to
      client.create_webhook(self.origin_name, self.builds_url)
    else
      client.delete_webhook
    end
    self.active = change_to
  end

  def builds_url
    URI.join(Bybro::SITE, "builds").to_s
  end

  def get_client(credential)
    "Providers::#{self.provider.camelcase}".constantize.new(credential.access_token)
  end
end
