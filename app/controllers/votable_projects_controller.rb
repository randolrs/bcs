class VotableProjectsController < ApplicationController
  before_action :set_votable_project, only: [:show, :edit, :update, :destroy]

  # GET /votable_projects
  # GET /votable_projects.json
  def index
    @votable_projects = VotableProject.all
  end

  # GET /votable_projects/1
  # GET /votable_projects/1.json
  def show
  end

  # GET /votable_projects/new
  def new
    @votable_project = VotableProject.new
  end

  # GET /votable_projects/1/edit
  def edit
  end

  # POST /votable_projects
  # POST /votable_projects.json
  def create
    @votable_project = VotableProject.new(votable_project_params)

    respond_to do |format|
      if @votable_project.save
        format.html { redirect_to @votable_project, notice: 'Votable project was successfully created.' }
        format.json { render :show, status: :created, location: @votable_project }
      else
        format.html { render :new }
        format.json { render json: @votable_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votable_projects/1
  # PATCH/PUT /votable_projects/1.json
  def update
    respond_to do |format|
      if @votable_project.update(votable_project_params)
        format.html { redirect_to @votable_project, notice: 'Votable project was successfully updated.' }
        format.json { render :show, status: :ok, location: @votable_project }
      else
        format.html { render :edit }
        format.json { render json: @votable_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votable_projects/1
  # DELETE /votable_projects/1.json
  def destroy
    @votable_project.destroy
    respond_to do |format|
      format.html { redirect_to votable_projects_url, notice: 'Votable project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votable_project
      @votable_project = VotableProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votable_project_params
      params.require(:votable_project).permit(:headline, :sub_headline, :reason_selected, :additional_information)
    end
end
