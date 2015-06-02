class Profile
  def initialize(name)
    @name = name
    @page = get_data
  end

  def real_name
    @page["name"]
  end

  def email
    @page["email"]
  end

  def get_data
    HTTParty.get("https://api.github.com/users/#{@name}?access_token=#{ENV["GIT_KEY"]}")
  end
end
