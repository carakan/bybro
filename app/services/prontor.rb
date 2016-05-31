class Prontor
  def initialize(build_id)
    @build = Build.find(build_id)
  end

  def make_review
    repository_id = @build.payload['repository']['id']
    if repository_id
      repo = Repository.active.where(origin_id: repository_id).first
      credential = repo.user
      client = repo.get_client(credential)
      pull_request = client.pull_request(repo.origin_name, @build.payload['pull_request']['id'])
      review_with_pronto(pull_request.map{|file| file['patch']})
    end
  end

  # probably impossible do witout fisical repo
  def review_with_pronto(diffs)
  end
end
