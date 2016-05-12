require 'rails_helper'

RSpec.describe Repository, type: :model do
  it 'activate a Repository' do
    repository = create(:repository)
    repository.activate
    expect(repository.active).to eq(true)
  end
end
