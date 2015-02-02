class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favourites = current_user.favourites
  end

  def create
    @project = Project.find params[:project_id]
    @favourite = @project.favourites.new
    @favourite.user_id = current_user.id
    if @favourite.save
      redirect_to @project, notice: "Favourited!"
    else
      redirect_to @project, alert: "Favourited Already"
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    # @favorite = current_user.favorites.find params[:id]
    @favourite = @project.favourites.find params[:id]
    if @favourite.destroy
      redirect_to @project, notice: "Unfavourited"
    else
      redirect_to @project, alert: "Sum Ting Wong"
    end
  end

end
