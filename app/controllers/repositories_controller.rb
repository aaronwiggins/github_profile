class RepositoriesController < ApplicationController
  def show
    @repositories = Repository.new("aaronwiggins")
    @profile = Profile.new(@repositories.profile_name)
  end

  def index

  end
end
