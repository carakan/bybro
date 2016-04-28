class SyncRepositoryJob < ActiveJob::Base
  # Set the Queue as Default
  queue_as :default

  def perform(credential_id)
    credential = User.find(credential_id)
    SyncRepository.new(credential).syncronize_repos
  end
end
