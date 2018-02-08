require "rails_helper"

describe "As a User" do
  describe "when I visit a specific tags page" do
    it "I can see a list of all jobs with that tag" do
      tag = create(:tag)
      job = create(:job)
      JobsTag.create!(tag: tag, job: job)

      visit tag_path(tag)

      expect(page).to have_content(job.title)
      expect(page).to have_content(job.level_of_interest)
    end
  end
end
