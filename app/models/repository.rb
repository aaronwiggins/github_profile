class Repository
  def initialize(name)
    @name = name
    @page = get_data
  end

  def profile_name
    p @page["items"][0]["login"]
  end

  def get_data
    HTTParty.get("https://api.github.com/search/users?q=#{@name}")
  end
end
