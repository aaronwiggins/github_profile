require 'test_helper'
require 'repository.rb'
class Repository
  def get_data
    JSON.parse(File.open("#{Rails.root}/test/models/repository.json").read)
  end
end

class RepositoryTest < ActiveSupport::TestCase
  test "mock github repository" do
    repository = Repository.new("aaronwiggins")
    assert_equal "aaronwiggins", repository.profile_name
  end
end
