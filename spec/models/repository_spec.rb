require 'rails_helper'

RSpec.describe Repository, type: :model do
  it 'activate a Repository' do
    repository = create(:repository, :active, :github)

    stub_hook_creation_request(repository.origin_name,
                               "#{Bybro::SITE}/builds",
                               repository.user.access_token)
    repository.activate
    expect(repository.active).to eq(true)
  end
end
