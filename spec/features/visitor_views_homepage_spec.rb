require 'spec_helper'

feature 'Visitor views homepage' do
  scenario 'displays home screen with button' do
    visit root_path
    expect(page).to have_content("Do Me!")  # App Title
    expect(page).to have_link("About")
    expect(page).to have_button("Suggest an activity")
  end
end