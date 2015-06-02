class Repository
  def initialize(name)
    @name = name
    @page = get_data
  end

  def profile_name
    @page[0]["owner"]["login"]
  end

  def file_names
    @page.map do |repo|
      repo["name"]
    end
  end

  def languages
    @page.map do |repo|
      repo["language"]
    end
  end

  def stargazers_count_per_repository
    @page.map do |repo|
      repo["stargazers_count"]
    end
  end

  def forks_count
    @page.map do |repo|
      repo["forks_count"]
    end
  end

  def last_updates
    @page.map do |repo|
      repo["updated_at"]
    end
  end

  def followers_link
    @page[0]["owner"]["followers_url"]
  end

  def following_link
    @page[0]["owner"]["following_url"]
  end

  def starred_link
    @page[0]["owner"]["starred_url"]
  end

  def organizations_link
    @page[0]["owner"]["organizations_url"]
  end

  def get_data
    HTTParty.get("https://api.github.com/users/#{@name}/repos?access_token=#{ENV["GIT_KEY"]}")
  end
end
