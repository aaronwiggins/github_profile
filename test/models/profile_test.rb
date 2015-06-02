require 'test_helper'
require 'profile.rb'

class Profile
  def get_data
    JSON.parse(File.open("#{Rails.root}/test/models/profile.json").read)
  end
end

class ProfileTest < ActiveSupport::TestCase
  test "mock github profile" do
    profile = Profile.new("aaronwiggins")
    assert_equal "Aaron Wiggins", profile.real_name
  end

  test "get profile email" do
    profile = Profile.new("aaronwiggins")
    assert_equal "apw7177@gmail.com", profile.email
  end

  test "get profile photo" do
    profile = Profile.new("aaronwiggins")
    assert_equal "https://avatars.githubusercontent.com/u/11933367?v=3", profile.photo_link
  end
end
