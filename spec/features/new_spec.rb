feature "new user can enter information and create an account" do
  before(:each) do
    visit "/new"
  end
  scenario "visitor enters information and clicks submit" do
    fill_in "username", with: "Luke"
    fill_in "password", with: "mccomb"
    click_on "Submit"
    expect(page).to have_content("Thank you for registering.")
  end
end