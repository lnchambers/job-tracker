class Tag < ApplicationRecord
  validates_presence_of :title
  has_many :jobs_tag
  has_many :jobs, through: :jobs_tag
end
