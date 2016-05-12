class SyncRepository
  SERVICES = %w(github gitlab bitbucket)
  attr_accessor :credentials

  def initialize(credentials, provider = :github)
    @credentials = credentials
    @provider = provider
  end

  def syncronize_repos
    Repository.transaction do
      api.repositories.each do |resource|
        attributes = api.class.extract_attributes(resource.to_hash)
        repository = Repository.find_or_initialize_by(attributes)
        repository.user_id = @credentials.id
        repository.save
      end
    end
  end

  private

  def api
    @api ||= Providers::Github.new(credentials.access_token)
  end
end
