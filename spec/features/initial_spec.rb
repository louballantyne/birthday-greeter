require './app'

describe Greeter do
  describe "The Homepage", type: :feature do
    before do
      visit '/'
      fill_in 'name', with: 'Bart'
      select 'September', from: 'month'
      select '29', from: 'day'
      click_button 'Go!'
    end
    it "Shows the entered date and name" do
      expect(page).to have_text 'September'
      expect(page).to have_text '29'
      expect(page).to have_text 'Bart'
    end
  end
end
