feature "visitor can visit home page" do
  before(:each) do
    visit "/"
  end
  scenario "visitor can see registration button" do
    expect(page).to have_content("Register")
  end
end