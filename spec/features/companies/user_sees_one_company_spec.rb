require 'rails_helper'

describe "User sees one company" do
  before :each do
    @company = create(:company)
    @job = create(:job, company: @company)
    @contact = create(:contact, company: @company)
  end
  scenario "a user sees a company" do
    visit company_path(@company)

    expect(current_path).to eq("/companies/#{@job.company_id}/jobs")
    expect(page).to have_content("Opakawagalaga")
  end

  scenario "a user sees a company's contacts" do
    visit company_path(@company)

    expect(page).to have_content(@company.name)
    expect(page).to have_content(@contact.name)
    expect(page).to have_content(@contact.position)
    expect(page).to have_content(@contact.email)
  end

  scenario "a user sees a company's jobs" do
    visit company_path(@company)

    expect(page).to have_content(@company.name)
    expect(page).to have_content(@job.title)
  end
end
