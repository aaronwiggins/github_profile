class Repository
  def initialize(name)
    @name = name
    @page = get_data
  end

  def profile_name
    @page[0]["owner"]["login"]
  end

  def file_names
    @page.map do |file|
      file["name"]
    end
  end

  def get_data
    HTTParty.get("https://api.github.com/users/#{@name}/repos?access_token=#{ENV["GIT_KEY"]}")
  end
end
