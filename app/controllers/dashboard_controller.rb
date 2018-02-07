class DashboardController < ApplicationController
  def index
    @jobs = Job.all
    @jobs = sort_jobs(params)
    @jobs = filter_location(params)
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

  def filter_location(params)
    @jobs = Job.where("city == ?", params[:location]) if params[:location]
  end
end
