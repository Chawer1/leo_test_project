class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @role = current_user.role
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to team_path(@team), notice: "Team was successfully updated."
    else
      render :edit
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def choose
    @teams = current_user.teams
  end

  def update_current_team
    team = Team.find(params[:team_id])
    current_user.update(current_team: team)
    redirect_to root_path, notice: "The active team has been successfully renewed."
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :other_attributes)
  end
end
