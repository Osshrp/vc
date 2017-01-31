require 'rails_helper'
require 'byebug'

feature "Visitor leave feedback" do
  before do
    visit root_path
    click_on 'New feedback'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Body', with: 'Some message'
    click_on 'Save'
  end

  scenario "they create new feedback", js: true do
    # click_on 'New feedback'
    # fill_in 'Email', with: 'test@example.com'
    # fill_in 'Body', with: 'Some message'
    # click_on 'Save'
    expect(page).to have_content 'Feedback successfully created'
    # expect(page).should has_no_selector?("input", match: 'Email')
  end
  scenario '', js: true do
    expect(page).to have_no_xpath('.//input[@name = "email"]')
  end
end
