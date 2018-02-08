class Tag < ApplicationRecord
  validates_presence_of :title
  has_many :jobs, through: :jobs_tags
end