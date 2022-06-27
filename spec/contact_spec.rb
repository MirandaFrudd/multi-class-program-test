require 'contact'

RSpec.describe Contact do
    it "adds a contact" do
        contact1 = Contact.new("Miranda", "07123456789")
        expect( contact1.name ).to eq "Miranda"
        expect( contact1.number ).to eq "07123456789"
    end

    it "fails if contact number is not 11 digits" do
        expect{ Contact.new("Miranda", "0712345678") }.to raise_error "Please check the phone number you are trying to add is correct"
    end
    
    it "fails if contact number does not start with zero" do
        expect{ Contact.new("Miranda", "71234567800") }.to raise_error "Please check the phone number you are trying to add is correct"
    end
end