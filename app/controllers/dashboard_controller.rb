class DashboardController < ApplicationController
  def index
    @top_companies = Company.top_three
    @interests = Job.interests
    @locations = Job.locations
  end
end
