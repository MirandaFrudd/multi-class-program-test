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

    it "returns longest readable entry in given time and reading rate" do
      diary = Diary.new
      entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
      entry2 = DiaryEntry.new("Tuesday 2 Jan", "One Two Three Four Five Six")
      entry3 = DiaryEntry.new("Wednesday 3 Jan", "One Two Three ")
      diary.add_entry(entry1)
      diary.add_entry(entry2)
      diary.add_entry(entry3)
      expect(diary.longest_entry_read(2, 3)).to eq "You can read an entry from Tuesday 2 Jan"
    end

    it "Returns an error if no entries are readable in the time given" do
      diary = Diary.new
      entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
      entry2 = DiaryEntry.new("Tuesday 2 Jan", "One Two Three Four Five Six")
      entry3 = DiaryEntry.new("Wednesday 3 Jan", "One Two Three ")
      diary.add_entry(entry1)
      diary.add_entry(entry2)
      diary.add_entry(entry3)
      expect {diary.longest_entry_read(1, 1)}.to raise_error "Sorry, you don't have time to read right now!"
    end
  end

  context "When tasks have been added" do
    it "return all tasks" do
      diary = Diary.new
      task1 = Task.new("Walk the dog")
      task2 = Task.new("Walk the pig")
      task3 = Task.new("Walk the frog")
      diary.add_task(task1)
      diary.add_task(task2)
      diary.add_task(task3)
      expect(diary.all_tasks).to eq "Walk the dog\nWalk the pig\nWalk the frog\n"
    end

    it "returns completed tasks" do
      diary = Diary.new
      task1 = Task.new("Walk the dog")
      task2 = Task.new("Walk the pig")
      task3 = Task.new("Walk the frog")
      diary.add_task(task1)
      diary.add_task(task2)
      diary.add_task(task3)
      task2.mark_complete
      expect(diary.complete_tasks).to eq "Walk the pig\n"
    end

    it "returns incomplete tasks" do
      diary = Diary.new
      task1 = Task.new("Walk the dog")
      task2 = Task.new("Walk the pig")
      task3 = Task.new("Walk the frog")
      diary.add_task(task1)
      diary.add_task(task2)
      diary.add_task(task3)
      task2.mark_complete
      expect(diary.incomplete_tasks).to eq "Walk the dog\nWalk the frog\n"
    end
  end

  context "When contacts have been added" do
    it "returns all contacts" do
      diary = Diary.new
      contact1 = Contact.new("Miranda", "07892398731")
      contact2 = Contact.new("Olivia", "07892398732")
      contact3 = Contact.new("Lauren", "07892398733")
      diary.add_contact(contact1)
      diary.add_contact(contact2)
      diary.add_contact(contact3)
      expect(diary.all_contacts).to eq "Miranda - 07892398731\nOlivia - 07892398732\nLauren - 07892398733\n"
    end

    it "returns all contacts except invalid ones" do
      diary = Diary.new
      contact1 = Contact.new("Miranda", "07892398731")
      expect{contact2 = Contact.new("Olivia", "0789239873")}.to raise_error "Please check the phone number you are trying to add is correct"
      contact3 = Contact.new("Lauren", "07892398733")
      diary.add_contact(contact1)
      diary.add_contact(contact3)
      expect(diary.all_contacts).to eq "Miranda - 07892398731\nLauren - 07892398733\n"
    end
  end
end

