require 'rails_helper'

RSpec.describe Mechanic, type: :model do
 
  it "can determine average years of experience for workers" do 
     bob = Mechanic.create!(name: "Bob", years_experience: "4")
      patrick = Mechanic.create!(name: "Patrick", years_experience: "5")
      krabs = Mechanic.create!(name: "Krabs", years_experience: "6")

      expect(Mechanic.average_years_experience).to eq(5)

  end
end