require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    comment = create(:comment)

    visit job_path(comment.job)

    expect(page).to have_content(comment.job.company.name)
    expect(page).to have_content(comment.job.title)
    expect(page).to have_content(comment.job.level_of_interest)
    expect(page).to have_content(comment.body)
  end

  scenario "a user sees the tags associated with a job" do
    tag = create(:tag)
    job = create(:job)
    job.tags << tag

    visit job_path(job)

    expect(page).to have_content(tag.title)
  end
end
