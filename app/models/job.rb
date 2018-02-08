class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments
  has_many :tags, through: :jobs_tags

  def self.interests
    interest = {}
    @jobs = Job.all
    interest["is less then 50"] = @jobs.where("level_of_interest <= 50").count
    interest["between 50 and 100"] = @jobs.where("level_of_interest > 50 AND level_of_interest <= 100").count
    interest["is greater then 100"] = @jobs.where("level_of_interest > 100").count
    interest
  end

  def self.locations
    group(:city).order("count(*) DESC").count
  end
end
