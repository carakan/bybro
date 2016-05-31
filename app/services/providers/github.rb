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

  def create_webhook(full_repo_name, callback_endpoint)
    hook = client.create_hook(
      full_repo_name,
      "web",
      { url: callback_endpoint },
      { events: ["pull_request"], active: true }
    )
  rescue Octokit::UnprocessableEntity => error
    if error.message.include? "Hook already exists"
      true
    else
      raise
    end
  end

  def pull_request(repo_name, number)
    client.pull_request_files(repo_name, number)
  end
end
