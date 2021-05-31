# frozen_string_literal: true

require "test_helper"

class FetchDependenciesJobTest < ActiveJob::TestCase
  test "app dependencies are updated" do
    repo = repos(:friday_repo)

    VCR.use_cassette('friday_repository') do
      FetchDependenciesJob.perform_now(repo.app)
    end

    repo.reload

    assert_not_nil repo.dependencies
  end
end