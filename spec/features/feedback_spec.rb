require 'rails_helper'

feature "Visitor leave feedback" do
  before do
    visit root_path
  end

  scenario "they whant to fill form", js: true do
    click_on 'feedback'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Message', with: 'Some message'
    click_on 'Submit'

    expect(page).to have_content 'Feedback has been send'
  end
end
