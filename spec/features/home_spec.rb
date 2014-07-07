feature "visitor can visit home page" do
  before(:each) do
    visit "/"
  end
  scenario "visitor can see registration button" do
    expect(page).to have_content("Register")
  end
  scenario "visitor can click registration button to view registration form" do
    click_on "Register"
    expect(page).to have_content("Username:")
    expect(page).to have_content("Password:")
    expect(page).to have_button("Submit")
  end
  scenario "registered user can log in" do
    click_on "Register"
    expect(page).to have_content("Username:")
    expect(page).to have_content("Password:")
    expect(page).to have_button("Submit")
    fill_in "username", with: "Luke"
    fill_in "password", with: "mccomb"
    click_on "Submit"
    expect(page).to have_content("Thank you for registering.")
    fill_in "username", with: "Luke"
    fill_in "password", with: "mccomb"
    click_on "Log In"
    expect(page).to have_content("Welcome, Luke.")
    expect(page).to have_content("Log Out")
  end
end