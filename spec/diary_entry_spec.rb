require 'diary_entry'

RSpec.describe DiaryEntry do
    context "User has access to the entries" do
        it "returns the #entry" do
            entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
            result = entry1.entry
            expect(result).to eq "One Two Three Four Five"
        end

        it "returns the #entry_name" do
            entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
            result = entry1.entry_name
            expect(result).to eq "Monday 1 Jan"
        end
    end

    context "Counts the number of words in an entry" do
        it "returns the number of words in an entry" do
            entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
            result = entry1.entry_length
            expect(result).to eq 5
        end 
    end
end