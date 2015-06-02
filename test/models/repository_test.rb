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

  test "find language for each repository" do
    repository = Repository.new("aaronwiggins")
    assert_equal "Ruby", repository.languages.first
  end

  test "find stargazers for each repository" do
    repository = Repository.new("aaronwiggins")
    assert_equal 0, repository.stargazers_count_per_repository.first
  end

  test "find forks for each repository" do
    repository = Repository.new("aaronwiggins")
    assert_equal 0, repository.forks_count.first
  end

  test "find last update for each repository" do
    repository = Repository.new("aaronwiggins")
    assert_equal "2015-05-14T04:16:37Z", repository.last_updates.first
  end

  test "get follwers link" do
    repository = Repository.new("aaronwiggins")
    assert_equal "https://api.github.com/users/aaronwiggins/followers",
    repository.followers_link
  end

  test "get following link" do
    repository = Repository.new("aaronwiggins")
    assert_equal "https://api.github.com/users/aaronwiggins/following{/other_user}",
    repository.following_link
  end

  test "get starred link" do
    repository = Repository.new("aaronwiggins")
    assert_equal "https://api.github.com/users/aaronwiggins/starred{/owner}{/repo}",
    repository.starred_link
  end

  test "get organizations link" do
    repository = Repository.new("aaronwiggins")
    assert_equal "https://api.github.com/users/aaronwiggins/orgs",
    repository.organizations_link
  end
end
