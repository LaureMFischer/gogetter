require 'spec_helper'

feature 'Visitor views homepage' do
  scenario 'displays home screen with button' do
    visit root_path
    expect(page).to have_content("Do it!")  # App Title
    expect(page).to have_link("About")
    expect(page).to have_link("Suggest an activity")
    expect(page).to have_link("Sign in")
    expect(page).to have_button("What should I do today?")
  end
end
