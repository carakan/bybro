class Providers::Github
  def initialize(token)
    @token = token
  end

  def client
    @client ||= Octokit::Client.new(access_token: @token, auto_paginate: true)
  end

  def repositories
    client.repos
  end

  # Deserializes the repository api attributes to model
  def self.extract_attributes(attributes)
    {
      private: attributes[:private],
      origin_id: attributes[:id],
      origin_name: attributes[:full_name],
      provider: :github
    }
  end
end
