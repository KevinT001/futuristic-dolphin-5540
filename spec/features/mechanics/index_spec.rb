require 'rails_helper'

RSpec.describe 'US_1' do
  describe 'mechanics index page' do
    it 'Visitor sees header saying "All Mechanics"' do 
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
      
    end

    it 'Visitor to see a list of all mechanic names and years of exp' do
      bob = Mechanic.create!(name: "Bob", years_experience: 4)
      patrick = Mechanic.create!(name: "Patrick", years_experience: 5)
      krabs = Mechanic.create!(name: "Krabs", years_experience: 6)
      visit '/mechanics'

      expect(page).to have_content("Bob")
      expect(page).to have_content("Patrick")
      expect(page).to have_content("Krabs")
      expect(page).to have_content(4)
      expect(page).to have_content(5)
      expect(page).to have_content(6)

    end

    it 'Visitor to see average years of experience for all mechanics' do 
      bob = Mechanic.create!(name: "Bob", years_experience: "4")
      patrick = Mechanic.create!(name: "Patrick", years_experience: "5")
      krabs = Mechanic.create!(name: "Krabs", years_experience: "6")

      visit '/mechanics'
      expect(page).to have_content"Average Years of Experience for all mechanics: 5"

    end
  end
end