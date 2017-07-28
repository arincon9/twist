require "rails_helper"

feature "Accounts" do
  scenario "creating an account" do
    visit root_path
    click_link "Create a new account"
    fill_in "Name", with: "test"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password", exact: true
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"
    expect(page).to have_content("Signed in as test@example.com")

    within(".flash_notice") do
      success_message = "Your account has been created."
      expect(page).to have_content(success_message)
    end
  end
end
