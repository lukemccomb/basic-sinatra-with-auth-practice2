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
end