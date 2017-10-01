class FundingApplicationsController < ApplicationController
  before_action :set_funding_application, only: [:show, :edit, :update, :destroy]

  # GET /funding_applications
  # GET /funding_applications.json
  def index
    @funding_applications = FundingApplication.all
  end

  # GET /funding_applications/1
  # GET /funding_applications/1.json
  def show
  end

  # GET /funding_applications/new
  def new
    @funding_application = FundingApplication.new
  end

  # GET /funding_applications/1/edit
  def edit
  end

  # POST /funding_applications
  # POST /funding_applications.json
  def create
    @funding_application = FundingApplication.new(funding_application_params)

    respond_to do |format|
      if @funding_application.save
        format.html { redirect_to @funding_application, notice: 'Funding application was successfully created.' }
        format.json { render :show, status: :created, location: @funding_application }
      else
        format.html { render :new }
        format.json { render json: @funding_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funding_applications/1
  # PATCH/PUT /funding_applications/1.json
  def update
    respond_to do |format|
      if @funding_application.update(funding_application_params)
        format.html { redirect_to @funding_application, notice: 'Funding application was successfully updated.' }
        format.json { render :show, status: :ok, location: @funding_application }
      else
        format.html { render :edit }
        format.json { render json: @funding_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funding_applications/1
  # DELETE /funding_applications/1.json
  def destroy
    @funding_application.destroy
    respond_to do |format|
      format.html { redirect_to funding_applications_url, notice: 'Funding application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funding_application
      @funding_application = FundingApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funding_application_params
      params.fetch(:funding_application, {}).permit(:name, :headline, :additional_information, :funding_application_questions_attributes => [:id, :question_text, :answer_format, :_destroy])
    end
end
