require 'rails_helper'

RSpec.describe Prontor do
  it "make a simple review" do
    build = create(:build, :repository_build)
    stub_pull_request_files_request(build.repository.origin_name,
                                    build.payload['pull_request']['id'],
                                    build.repository.user.access_token)
    runner = Prontor.new(build.id).make_review
  end
end
