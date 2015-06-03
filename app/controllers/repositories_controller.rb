class RepositoriesController < ApplicationController
  def index
    @username = params[:name]
  end


  def show
    @repositories = Repository.new(params[:name])
    @profile = Profile.new(@repositories.profile_name)
  end

end
