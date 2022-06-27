require 'contact'

RSpec.describe Contact do
    it "adds a contact" do
        contact1 = Contact.new("Miranda", "07123456789")
        result = contact1.add
        expect(result).to eq "Miranda - 07123456789"
    end


end