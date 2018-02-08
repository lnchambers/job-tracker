class JobsTag < ApplicationRecord
  has_many :jobs
  has_many :tags
end
