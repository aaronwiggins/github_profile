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

  test "get date profile created with all details" do
    profile = Profile.new("aaronwiggins")
    assert_equal "2015-04-13T23:10:21Z", profile.date_created_raw
  end

  test "get date profile created pretty" do
    profile = Profile.new("aaronwiggins")
    assert_equal "April 13, 2015", profile.date_created_pretty
  end

  test "get date profile created pretty with time" do
    profile = Profile.new("aaronwiggins")
    assert_equal "April 13, 2015, 12:00 AM EDT", profile.date_created_with_time
  end


end
