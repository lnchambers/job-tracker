class DashboardController < ApplicationController
  def index
    if params[:location]
      @jobs = Job.where("city LIKE ?", params[:location])
    else
      @jobs = Job.all
    end
    @jobs = sort_jobs(params)
    @top_companies = Company.top_three
    @interests = Job.interests
    @locations = Job.locations
  end

  def sort_jobs(params)
    if params[:sort] == "location"
      @jobs = @jobs.order(:city)
    elsif params[:sort] == "interest"
      @jobs = @jobs.order(level_of_interest: :desc)
    end
  end
end
