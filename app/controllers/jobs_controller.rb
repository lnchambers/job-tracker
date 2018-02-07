class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @jobs = sort(params, @jobs)
    @jobs = Job.where("city = #{params[:location]}") if params[:location]
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to company_path(job.company_id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def sort(params, jobs)
    if params[:show] == "location"
      jobs = jobs.order(:city)
    elsif params[:show] == "interest"
      jobs = jobs.order(level_of_interest: :desc)
    end
  end
end
