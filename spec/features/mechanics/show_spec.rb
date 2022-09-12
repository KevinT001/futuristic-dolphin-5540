require 'rails_helper'

RSpec.describe "US 2 Mechanic SHOW page" do
  it 'Visitor can see the workers name, experience, and rides they are working on, excluding closed rides' do 
    bob = Mechanic.create!(name: "Bob", years_experience: "4")
    patrick = Mechanic.create!(name: "Patrick", years_experience: "5")
    krabs = Mechanic.create!(name: "Krabs", years_experience: "6")

    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    MechanicRide.create!(mechanic_id: bob.id, ride_id: scrambler.id)
    MechanicRide.create!(mechanic_id: bob.id, ride_id: ferris.id)
    

    visit "/mechanics/#{bob.id}"

    expect(page).to have_content("Name: Bob")
    expect(page).to have_content("Years of Experience: 4")
    expect(page).to have_content("Rides worked on: ")

    expect(page).to_not have_content("Krabs")
    expect(page).to_not have_content("Ferris Wheel")
  end 
end