require "diary"
require "diary_entry"
require "contact"
require "task"

RSpec.describe "integration" do
  context "when diary entries have been added" do
    it "returns list of diary entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
      entry2 = DiaryEntry.new("Tuesday 2 Jan", "One Two Three Four Five Six")
      entry3 = DiaryEntry.new("Wednesday 3 Jan", "One Two Three")
      diary.add_entry(entry1)
      diary.add_entry(entry2)
      diary.add_entry(entry3)
      expect(diary.all_entries).to eq "Monday 1 Jan - One Two Three Four Five\nTuesday 2 Jan - One Two Three Four Five Six\nWednesday 3 Jan - One Two Three\n"
    end
  end
end