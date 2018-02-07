class DashboardController < ApplicationController
  def index
    @jobs = Job.all
    @jobs = sort_jobs(params, @jobs)
    @jobs = filter_location(params, @jobs)
    @top_companies = Company.top_three
    @interests = Job.interests
    @locations = Job.locations
  end

  def sort_jobs(params, jobs)
    if params[:sort] == "location"
      jobs = jobs.order(:city)
    elsif params[:sort] == "interest"
      jobs = jobs.order(level_of_interest: :desc)
    end
    jobs
  end

  def filter_location(params, jobs)
    if params[:location]
      jobs = jobs.where("city = '#{params[:location]}'")
    end
    jobs
  end
end
