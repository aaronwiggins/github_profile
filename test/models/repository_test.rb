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

  test "get repository names" do
    repository = Repository.new("aaronwiggins")
    assert_equal ["battleship", "Blackjack_Advisor", "Currency_Converter",
        "employee_review", "github_profile", "number_guessing",
        "time_entry_data_structure", "voting_api", "weather_report",
        "Week1-Day2-Method-Exercise"], repository.file_names
  end


end
