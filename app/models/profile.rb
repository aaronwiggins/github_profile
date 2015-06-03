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

  def photo_link
    @page["avatar_url"]
  end

  def date_created_raw
    time_long = @page["created_at"]
    # %= @time.strftime("%B %e, %Y") %>
  end

  def date_created_pretty
    time_long = @page["created_at"]
    clean_time = time_long.to_date.strftime("%B %e, %Y")
  end

  def date_created_with_time
    time_long = @page["created_at"]
    clean_time = time_long.to_date.strftime("%B %e, %Y, %l:%M %p EDT")
  end

  def company
    @page["company"]
  end

  def hometown
    @page["location"]
  end

  def followers_count
    @page["followers"]
  end

  def followers_link
    @page["followers_url"]
  end

  def following_count
    @page["following"]
  end

  def following_link
    @page["following_url"]
  end

  def get_data
    HTTParty.get("https://api.github.com/users/#{@name}?access_token=#{ENV["GIT_KEY"]}")
  end
end
