class FundingApplicationSubmissionsController < ApplicationController
  before_action :set_funding_application_submission, only: [:show, :edit, :update, :destroy]

  def initiate

    @funding_application_submission = FundingApplicationSubmission.new

    if params[:funding_application_id]

      if FundingApplication.where(:id => params[:funding_application_id]).exists?

        @funding_application = FundingApplication.find(params[:funding_application_id])

      else
        flash[:notice] = "That funding application no longer exists."
        redirect_to root_path
      end

    else


    end

  end

  # GET /funding_application_submissions
  # GET /funding_application_submissions.json
  def index
    @funding_application_submissions = FundingApplicationSubmission.all
  end

  # GET /funding_application_submissions/1
  # GET /funding_application_submissions/1.json
  def show
  end

  # GET /funding_application_submissions/new
  def new
    @funding_application_submission = FundingApplicationSubmission.new
  end

  # GET /funding_application_submissions/1/edit
  def edit
    @funding_application = @funding_application_submission.funding_application
  end

  # POST /funding_application_submissions
  # POST /funding_application_submissions.json
  def create
    @funding_application_submission = FundingApplicationSubmission.new(funding_application_submission_params)

    respond_to do |format|
      if @funding_application_submission.save
        @funding_application_submission.update(:user_id => current_user.id)
        format.html { redirect_to @funding_application_submission, notice: 'Funding application submission was successfully created.' }
        format.json { render :show, status: :created, location: @funding_application_submission }
      else
        format.html { render :new }
        format.json { render json: @funding_application_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funding_application_submissions/1
  # PATCH/PUT /funding_application_submissions/1.json
  def update
    respond_to do |format|
      if @funding_application_submission.update(funding_application_submission_params)
        format.html { redirect_to @funding_application_submission, notice: 'Funding application submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @funding_application_submission }
      else
        format.html { render :edit }
        format.json { render json: @funding_application_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funding_application_submissions/1
  # DELETE /funding_application_submissions/1.json
  def destroy
    @funding_application_submission.destroy
    respond_to do |format|
      format.html { redirect_to funding_application_submissions_url, notice: 'Funding application submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funding_application_submission
      @funding_application_submission = FundingApplicationSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funding_application_submission_params
      params.fetch(:funding_application_submission, {}).permit(:funding_application_id, :funding_application_submission_answers_attributes => [:id, :funding_application_submission_id, :funding_application_question_id, :answer_text, :answer_number, :answer_boolean])
    end
end
